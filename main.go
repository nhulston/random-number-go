package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"math/rand"

	ddlambda "github.com/DataDog/datadog-lambda-go"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/eventbridge"
	"github.com/aws/aws-sdk-go-v2/service/eventbridge/types"
	"github.com/aws/aws-sdk-go-v2/service/sns"
	"github.com/aws/aws-sdk-go-v2/service/sqs"
	// Add Datadog tracing for AWS SDK
	awstrace "gopkg.in/DataDog/dd-trace-go.v1/contrib/aws/aws-sdk-go-v2/aws"
)

const (
	SqsQueueUrl        = "https://sqs.us-east-1.amazonaws.com/425362996713/nhulston-go-queue"
	SnsTopicArn        = "arn:aws:sns:us-east-1:425362996713:nhulston-go-topic"
	EventBridgeBusName = "nhulston-go-bus"
)

type LambdaInput struct {
	PublishToSQS bool `json:"publishToSQS"`
	PublishToSNS bool `json:"publishToSNS"`
	PublishToEB  bool `json:"publishToEB"`
}

func main() {
	lambda.Start(ddlambda.WrapFunction(FunctionHandler, nil))
}

func FunctionHandler(ctx context.Context, input LambdaInput) (int, error) {
	randomNumber := rand.Intn(10) + 1
	log.Printf("Generated random number: %d", randomNumber)

	cfg, err := config.LoadDefaultConfig(ctx)
	if err != nil {
		log.Printf("Failed to load AWS config: %v", err)
		return 0, err
	}

	awstrace.AppendMiddleware(&cfg)

	if input.PublishToSQS {
		if err := SendMessageToSqs(ctx, cfg, fmt.Sprintf("%d", randomNumber)); err != nil {
			log.Printf("Failed to send message to SQS: %v", err)
		}
	}

	if input.PublishToSNS {
		if err := PublishToSns(ctx, cfg, fmt.Sprintf("%d", randomNumber)); err != nil {
			log.Printf("Failed to publish message to SNS: %v", err)
		}
	}

	if input.PublishToEB {
		if err := PublishToEventBridge(ctx, cfg, randomNumber); err != nil {
			log.Printf("Failed to publish event to EventBridge: %v", err)
		}
	}

	return randomNumber, nil
}

func SendMessageToSqs(ctx context.Context, cfg aws.Config, message string) error {
	sqsClient := sqs.NewFromConfig(cfg)
	_, err := sqsClient.SendMessage(ctx, &sqs.SendMessageInput{
		QueueUrl:    aws.String(SqsQueueUrl),
		MessageBody: aws.String(message),
	})
	if err != nil {
		return err
	}
	log.Println("Message sent to SQS")
	return nil
}

func PublishToSns(ctx context.Context, cfg aws.Config, message string) error {
	snsClient := sns.NewFromConfig(cfg)
	_, err := snsClient.Publish(ctx, &sns.PublishInput{
		TopicArn: aws.String(SnsTopicArn),
		Message:  aws.String(message),
	})
	if err != nil {
		return err
	}
	log.Println("Message published to SNS")
	return nil
}

func PublishToEventBridge(ctx context.Context, cfg aws.Config, randomNumber int) error {
	ebClient := eventbridge.NewFromConfig(cfg)
	detail, _ := json.Marshal(map[string]int{"RandomNumber": randomNumber})
	_, err := ebClient.PutEvents(ctx, &eventbridge.PutEventsInput{
		Entries: []types.PutEventsRequestEntry{
			{
				Source:       aws.String("com.nhulston.rnggo"),
				DetailType:   aws.String("RandomNumber"),
				Detail:       aws.String(string(detail)),
				EventBusName: aws.String(EventBridgeBusName),
			},
		},
	})
	if err != nil {
		return err
	}
	log.Println("Event published to EventBridge")
	return nil
}
