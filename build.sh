go mod tidy
GOOS=linux GOARCH=arm64 go build -tags lambda.norpc -o bootstrap main.go
zip lambda.zip bootstrap

# Then you have to upload new zip to Lambda
