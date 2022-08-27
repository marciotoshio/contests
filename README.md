# README

* Ruby version
  3.1.2

* Rails version
  7.0.3.1

* System dependencies
  Docker

* Project source
  https://github.com/marciotoshio/contests

* Deployment url
  https://contestsx.herokuapp.com/


# Development

First build a new image for the container:
```
docker compose build
```

Then you can configure and start the service with:
```
./scripts/rails db:setup
./scripts/up
```

You can run every rails command in the container using the rails helper script:
```
./scripts/rails
```

To run all specs:
```
./scripts/rails spec
```
