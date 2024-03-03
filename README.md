# Docker Python App with User Input

Python simple CLI app in Docker container with `docker-compose.yml` and a volume.

## Run Locally

1. `docker compose build goodbuy-app`
1. `docker compose run --rm goodbuy-app`
1. `docker images`
1. `docker rmi <image_id>`

## Run on Remote Docker Host

1. `export DOCKER_HOST=tcp://docker-pi-00:2375`
1. `docker compose build goodbuy-app`
1. `docker compose run --rm goodbuy-app`
1. `docker images`
1. `docker rmi <image_id>`

## Build and Run

1. `docker compose build goodbuy-app`
    - This command builds the Docker image for the `goodbuy-app` service defined in `docker-compose.yml`.
    - `docker compose build` is used to build your service.
    - `goodbuy-app` is the name of your service defined in `docker-compose.yml`.

1. `docker compose run --rm goodbuy-app`
    - This command runs the `goodbuy-app` service defined in `docker-compose.yml`.
    - `docker compose run` is used to run your service.
    - `--rm` automatically removes the container when it exits. This is optional but helps keep your environment clean.
    - `goodbuy-app` is the name of your service defined in `docker-compose.yml`.

## Additional Information

[Interactive Docker Setup](https://chat.openai.com/share/d2124cc4-35e2-4c09-a1eb-d528e0dea2ca)

To modify your Python script so that it prompts the user for input and then prints the input to the terminal, you'll need to use the `input()` function. This modification involves a minor change to your Python script. However, when running inside a Docker container, especially with `docker-compose`, making sure the container can accept interactive input from the user requires some additional considerations.

Here's how you can modify your Python script (`goodbuy.py`) and adjust your Docker setup to support this:

### Modified Python Script (`goodbuy.py`)

```python
def main():
    user_input = input("Please enter something to print: ")  # Prompt for user input
    print(f"You entered: {user_input}")


if __name__ == "__main__":
    main()
```

### Adjustments for Docker

Your Dockerfile does not need any changes to support this modification, as it already sets up a Python environment suitable for running your script.

However, to ensure that your Docker container can accept interactive input when using `docker-compose`, you should run your container in an interactive mode. By default, `docker-compose up` runs containers in the background. To interact with your container, you can use the following command options:

```bash
docker-compose run --rm goodbuy-app
```

This command does the following:
- `docker-compose run` is used instead of `docker-compose up` to run your service interactively.
- `--rm` automatically removes the container when it exits. This is optional but helps keep your environment clean.
- `goodbuy-app` is the name of your service defined in `docker-compose.yml`.

If you specifically want to use `docker-compose up` and still maintain interactivity, you'd typically need to attach to the container after it's started, but this approach is more suited to detached services rather than interactive applications. Therefore, using `docker-compose run` for interactive scripts is the recommended approach.

Remember, when deploying interactive applications in Docker containers, it's essential to consider the user experience and how input/output will be managed, as Docker can change the usual ways stdin and stdout work in a terminal environment.