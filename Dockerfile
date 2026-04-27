FROM gcr.io/distroless/static-debian12 AS runner

WORKDIR /app

COPY --chown=nonroot:nonroot ./my-go-app ./main
COPY --chown=nonroot:nonroot ./static ./static
RUN chmod +x main 
EXPOSE 8080

USER nonroot:nonroot

CMD ["/app/main"]