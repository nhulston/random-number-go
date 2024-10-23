module random-number-go

go 1.23.0

require (
	github.com/DataDog/datadog-lambda-go v1.19.0
	github.com/aws/aws-lambda-go v1.47.0
	github.com/aws/aws-sdk-go-v2 v1.31.0
	github.com/aws/aws-sdk-go-v2/config v1.27.38
	github.com/aws/aws-sdk-go-v2/service/eventbridge v1.34.2
	github.com/aws/aws-sdk-go-v2/service/sns v1.32.2
	github.com/aws/aws-sdk-go-v2/service/sqs v1.35.2
	gopkg.in/DataDog/dd-trace-go.v1 v1.68.0
)

// replace gopkg.in/DataDog/dd-trace-go.v1 => github.com/DataDog/dd-trace-go main
replace gopkg.in/DataDog/dd-trace-go.v1 => github.com/DataDog/dd-trace-go v1.39.0-alpha.1.0.20241022150148-2edf44588ce1

require (
	github.com/DataDog/appsec-internal-go v1.8.0 // indirect
	github.com/DataDog/datadog-agent/pkg/obfuscate v0.57.1 // indirect
	github.com/DataDog/datadog-agent/pkg/remoteconfig/state v0.57.1 // indirect
	github.com/DataDog/datadog-go/v5 v5.5.0 // indirect
	github.com/DataDog/go-libddwaf/v3 v3.4.0 // indirect
	github.com/DataDog/go-sqllexer v0.0.14 // indirect
	github.com/DataDog/go-tuf v1.1.0-0.5.2 // indirect
	github.com/DataDog/sketches-go v1.4.6 // indirect
	github.com/Microsoft/go-winio v0.6.2 // indirect
	github.com/andybalholm/brotli v1.1.0 // indirect
	github.com/aws/aws-sdk-go v1.55.5 // indirect
	github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream v1.4.13 // indirect
	github.com/aws/aws-sdk-go-v2/credentials v1.17.36 // indirect
	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.14 // indirect
	github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.18 // indirect
	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.18 // indirect
	github.com/aws/aws-sdk-go-v2/internal/ini v1.8.1 // indirect
	github.com/aws/aws-sdk-go-v2/internal/v4a v1.3.18 // indirect
	github.com/aws/aws-sdk-go-v2/service/dynamodb v1.21.4 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.11.5 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/checksum v1.1.35 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/endpoint-discovery v1.7.34 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.11.20 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/s3shared v1.15.3 // indirect
	github.com/aws/aws-sdk-go-v2/service/kinesis v1.18.4 // indirect
	github.com/aws/aws-sdk-go-v2/service/kms v1.36.2 // indirect
	github.com/aws/aws-sdk-go-v2/service/s3 v1.32.0 // indirect
	github.com/aws/aws-sdk-go-v2/service/sfn v1.19.4 // indirect
	github.com/aws/aws-sdk-go-v2/service/sso v1.23.2 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssooidc v1.27.2 // indirect
	github.com/aws/aws-sdk-go-v2/service/sts v1.31.2 // indirect
	github.com/aws/aws-xray-sdk-go v1.8.4 // indirect
	github.com/aws/smithy-go v1.21.0 // indirect
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/eapache/queue/v2 v2.0.0-20230407133247-75960ed334e4 // indirect
	github.com/ebitengine/purego v0.8.0 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/hashicorp/go-secure-stdlib/parseutil v0.1.7 // indirect
	github.com/hashicorp/go-secure-stdlib/strutil v0.1.2 // indirect
	github.com/hashicorp/go-sockaddr v1.0.2 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/klauspost/compress v1.17.10 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/outcaste-io/ristretto v0.2.3 // indirect
	github.com/philhofer/fwd v1.1.3-0.20240612014219-fbbf4953d986 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/ryanuber/go-glob v1.0.0 // indirect
	github.com/secure-systems-lab/go-securesystemslib v0.8.0 // indirect
	github.com/sony/gobreaker v1.0.0 // indirect
	github.com/tinylib/msgp v1.2.1 // indirect
	github.com/valyala/bytebufferpool v1.0.0 // indirect
	github.com/valyala/fasthttp v1.56.0 // indirect
	go.opentelemetry.io/otel v1.30.0 // indirect
	go.opentelemetry.io/otel/metric v1.30.0 // indirect
	go.opentelemetry.io/otel/trace v1.30.0 // indirect
	go.uber.org/atomic v1.11.0 // indirect
	golang.org/x/mod v0.18.0 // indirect
	golang.org/x/net v0.29.0 // indirect
	golang.org/x/sys v0.25.0 // indirect
	golang.org/x/text v0.18.0 // indirect
	golang.org/x/time v0.6.0 // indirect
	golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240924160255-9d4c2d233b61 // indirect
	google.golang.org/grpc v1.67.0 // indirect
	google.golang.org/protobuf v1.34.2 // indirect
)
