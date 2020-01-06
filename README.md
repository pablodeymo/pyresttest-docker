# pyresttest-docker
Docker image for pyresttest project

This is a Docker image for project pyresttest: https://github.com/svanoort/pyresttest
with the patch of https://github.com/torchingloom/pyresttest to allow file upload.

USE THIS AT YOUR OWN RISK.

## How to compile image
```
docker build -t pyrestfull .
```

## How to run
```
docker run --rm --network=@@@@ \
    -v $PWD/hosts:/etc/hosts \
    -v $PWD/tests:/tests \
    pyrestfull --absolute-url http://your-url test.yml
```
