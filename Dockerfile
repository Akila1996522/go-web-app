FROM gcr.io/distroless/static-debian12 AS runner

WORKDIR /app

COPY --chown=nonroot:nonroot --chmod=755 ./my-go-app /app/main
COPY --chown=nonroot:nonroot ./static /app/static

EXPOSE 8080

USER nonroot:nonroot

CMD ["/app/main"]