# pyresttest-docker
Docker image for [pyresttest](https://github.com/svanoort/pyresttest) project.

This is a Docker image for project pyresttest: https://github.com/svanoort/pyresttest
with the patch of https://github.com/torchingloom/pyresttest to allow file upload.

USE THIS AT YOUR OWN RISK.

## How to compile image
```
docker build -t pyrestfull .
```

## How to run tests
  * Create a tests sub-folder
  * Put your test.yml inside tests/
  * Run:
```
docker run --rm --network=your-docker-network \
    -v $PWD/tests:/tests \
    pyrestfull --absolute-url http://your-container-name test.yml
```

Where:
  *  **your-docker-network** is the name of the network you have in tour docker running instance.
  * **your-container-name** is the name of the docker container inside your docker network.
