# Laravel Docker

<p align="left">
    <a target="_blank" href="https://github.com/slovenski/laravel-docker/blob/master/LICENSE"><img src="https://img.shields.io/github/license/slovenski/laravel-docker?color=blue" alt="MIT License" /></a>
    <a target="_blank" href="https://github.com/slovenski/laravel-docker/issues"><img src="https://img.shields.io/github/issues/slovenski/laravel-docker" alt="Issue" /></a>
</p>

This repository contains a Laravel installation setup to use Docker to create a development environment without requiring you to install LEMP stack on your local machine. This repository can be used as a starting point for developing Laravel apps with Docker. It requires [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/).

This setup contains:

- PHP-FPM (PHP 7.2)
- Nginx Web Server
- MySQL Database

## Bringing up the stack

### Step 1: Clone Repository

Clone this repository onto the Docker host that will run the stack:

```
git clone --recursive https://github.com/slovenski/laravel-docker.git
```

### Step 2: Install Dependencies

Now run the following docker command in order to install Laravel dependencies:

```
cd laravel-app
docker run --rm -v $(pwd):/app composer install
```

### Step 3: Environment Configuration File

Make a copy of the `.env.example` file that Laravel includes by default and name the copy `.env`.

### Step 4: Run the Services

Then from your project directory, start the application services by running:

```
docker-compose up -d
```

### Step 5: Generate Application key & optimize


To create the application key we use `artisan`, but since all our PHP installation is inside the container, we run:

```
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan config:cache
docker-compose exec app php artisan optimize
```

## Going further

### Swarm mode

Experimental support for Docker [Swarm mode](https://docs.docker.com/engine/swarm/) is provided in the form of a `docker-stack.yml` file, which can be deployed in an existing Swarm cluster using the following command:

```
$ docker stack deploy -c docker-stack.yml laravel
```

> :information_source: You can read my blog post for more information about [Orchestrate Laravel application with Docker Swarm](https://gibransvarga.com/architecting-a-highly-available-apps-part-2/).

### Contributing

Contributions are welcome! Leave an [issue](https://github.com/slovenski/laravel-docker/issues
) on Github, or create a Pull Request.
