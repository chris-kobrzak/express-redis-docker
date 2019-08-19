# Express Redis Docker app

Requirements: [Docker Community Edition](https://www.docker.com/community-edition)

To start the app run: `docker-compose up`.

It will then be started on port 3000.

# Endpoints

## Hello World

```sh
curl http://localhost:3000
# or
curl http://localhost:3001
```

## Storing Data
```sh
curl http://localhost:3000/store/my-key\?some\=value\&some-other\=other-value
```

## Fetching Data

```sh
curl http://localhost:3000/my-key
```

# Starting app container directly

Provided the application is running via `docker-compose up`, you might
want to demonstrate how to simultaneously run multiple versions of the same
app utilising the same Redis instance. This might be useful e.g. when testing
new features.

Make a change in the code and the run the following commands:

```sh
docker-compose rebuild

docker image ls # Note down the ID of the newly created image

docker run -d \
  -p 3002:3000 \
  -e REDIS_URL=redis://host.docker.internal:6379 \
  <Docker image ID>
```

You should now be able to see the two existing instances of the application
still available on ports 3000 and 3001, as well as the new one on port 3002.
