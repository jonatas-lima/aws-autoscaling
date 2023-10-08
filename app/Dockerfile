FROM golang:1.21.0 AS build

WORKDIR /dist

COPY go.mod ./

RUN go mod tidy

COPY . .

RUN go build && chmod +x aws-autoscaling

FROM ubuntu:22.04

WORKDIR /app

COPY --from=build /dist/aws-autoscaling .

EXPOSE 8080

ENTRYPOINT [ "/app/aws-autoscaling" ]
