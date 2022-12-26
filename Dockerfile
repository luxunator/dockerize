# Get the build container
FROM golang:1.19-alpine as build

# Create working diretory and copy code to containter
WORKDIR /app
COPY . .

# Build service (disable CGO to not link to C libraries)
RUN CGO_ENABLED=0 go build -v -o /app/dockerize ./cmd/dockerize

# Get the base container for service
FROM gcr.io/distroless/static 

# Move compiled binary from build container to service container 
COPY --from=build /app/dockerize /dockerize

# Execute birary
ENTRYPOINT ["/dockerize"]

# Port documentation
EXPOSE 8080/tcp
