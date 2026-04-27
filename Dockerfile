FROM gcr.io/distroless/static-debian12 AS runner

WORKDIR /app

COPY --chown=nonroot:nonroot /app/main ./main
COPY --chown=nonroot:nonroot /app/static ./static

EXPOSE 8080

USER nonroot:nonroot

CMD ["/app/main"]