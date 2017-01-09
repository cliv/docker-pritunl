# Pritunl + Docker = <3

## Pull the image

    docker pull cliv/docker-pritunl

## Run Pritunl

    docker run -d \
        -v {path}:/mongodb \ # MongoDB Data
        -p 1194:1194/udp \
        -p 1194:1194/tcp \
        -p 9700:9700/tcp \
        cliv/docker-pritunl

## Configure Pritunl

* Open https://<youripaddress:9700
* Login with username pritunl and password pritunl
* Fun
