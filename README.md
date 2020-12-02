# random-logger

Docker image for a random log generator, based on Alpine Linux.

![release](https://github.com/jgrumboe/random-logger/workflows/release/badge.svg)
![Docker Image Version (latest by date)](https://img.shields.io/docker/v/jgrumboe/random-logger)

## What is this?

This image will execute a container which will generate four random log messages:

* `2018-03-02T22:33:27-06:00 ERROR something happened in this execution.`
* `2018-03-02T22:33:27-06:00 INFO takes the value and converts it to string.`
* `2018-03-02T22:33:27-06:00 WARN variable not in use.`
* `2018-03-02T22:33:27-06:00 DEBUG first loop completed.`

## Why this Image?

I've had the necessity to create a random logger to test log configurations with containers, this helped me out to do it easily.

## What is inside of this repo?

In this git repository you will find the docker image definitions for the random Logger for Alpine Linux

* `Dockerfile` -> Contains image definition.
* `entrypoint.sh` -> Shell code to generate log messages.

## How do I use this image?

To use this image you must do as follows:

```bash
# you can use tags latest
docker pull jgrumboe/random-logger:latest

# use different intervals to print logs every random(100, 400) milliseconds
docker run jgrumboe/random-logger:latest 100 400

# use the third parameter so limit the number of loglines (after generating the lines the container will stop).
# if not set it runs infinite
docker run jgrumboe/random-logger:latest 100 400 100

# to run the image just execute
docker run -d jgrumboe/random-logger:latest
```

You will have now a docker container running and generating log messages, locate it running:

```bash
docker ps
```

You can see the logs using this command

```bash
docker logs <- container-id ->
```

## How do I build this images?

First things first, you can find these docker images in `jgrumboe/random-logger`
but you can also build a specific version on your own, you only need:

* docker
* git

Clone this repo

`git clone https://github.com/jgrumboe/random-logger.git`

Go to the folder in your terminal and type this:

```bash
# cd into folder
cd random-logger
# Then build the new image
docker build -f Dockerfile .
```

If you want to tag your image use the following command

```bash
docker build -f Dockerfile -t yourbase/yourname:version .
```

---

For more on docker build reference to the [Documentation](https://docs.docker.com/engine/reference/commandline/build/)


You can get the source from the image in the [Repository](https://github.com/jgrumboe/random-logger)
