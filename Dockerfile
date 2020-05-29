
#build stage
FROM golang:alpine AS builder
ENV GO111MODULE=on
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN GOOS=linux GOARCH=amd64 go build .

ENTRYPOINT ["/app/go-autho-webapp"]
LABEL Name=gnharishkumar Version=0.0.1
EXPOSE 3000

