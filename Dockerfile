FROM golang:1.20-alpine as base
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY . .
RUN go build -o main .

FROM gcr.io/distroless/base as runner
WORKDIR /app
RUN adduser -D -u 1000 appuser && chown -R appuser:appuser /app
COPY --from=base /app/main .
COPY --from=base /app/static ./static
EXPOSE 8080
USER appuser
CMD ["/main"]