# sinopia.docker

:package: npm private registry (with sinopia) docker image

Current status: Work in Progress

## Usage

`sinopia.docker` is capable of doing a little bit more than `sinopia` current
releases when pointing on storage backends, since:
- Docker Volumes - I'm using Volumes for development
- nfs - findhit is using BTSync NFS storage on their clusters

As so, there are some ways to launch this image

### Container ephemeral storage

```bash
docker run \
    --name=npm-repository \
    cusspvz/sinopia:latest
```

### Launching with volume storage

```bash
docker run \
    --name=npm-repository \
    -e STORAGE=volume \
    -e STORAGE_DATA_PATH=/data \
    -v /host/path/to/data:/data \
    cusspvz/sinopia:latest
```

### Launching with NFS storage

```bash
docker run \
    --name=npm-repository \
    -e STORAGE=nfs \
    -e STORAGE_NFS_HOST=some.nfs.server.net \
    -e STORAGE_NFS_PATH=/path/to/data \
    cusspvz/sinopia:latest
```

#### Launching with [btsync](//github.com/cusspvz/btsync.docker)
```bash
docker run \
    --name btsync-nfs \
    cusspvz/btsync \
    bootstrap SECRET_HERE sinopia \
;

docker run \
    --name=npm-repository \
    -l btsync-nfs:nfs-server \
    -e STORAGE=nfs \
    cusspvz/sinopia:latest \
;
```

## Environment Variables

### Admin access related

#### ADMIN_USERNAME
Admin username.
Defaults to: `admin`

#### ADMIN_PASSWORD
Admin password hashed over sha1.
Defaults to: `4015bc9ee91e437d90df83fb64fbbe312d9c9f05`

Pro-Tip: You could hash easily over shell by executing:
```bash
echo "password" | sha1sum
```

### Authentication related

#### AUTH
Authentication method
* htpasswd (Default)
* ldap

#### AUTH_HTPASSWD_MAX_USERS
Maximum users allowed to register
* -1 (Default) - disables registration
* any number - limits registration to the provided number of users
* +inf - disables limit

### Web UI related

#### WEB
Enable or disable web ui interface.
* false (Default)
* true

#### WEB_TITLE
Title for the web interface.
Defaults to: `cusspvz/sinopia`

#### WEB_LOGO
BASE64 of the web logo

Pro-Tip: You could create a BASE64 of a file by executing:
```bash
base64 logo.jpg
```

#### WEB_TEMPLATE
BASE64 of the web template

Pro-Tip: You could create a BASE64 of a file by executing:
```bash
base64 custom.hbs
```

### Upstreams related

##### (TODO)

### Private packages related

##### (TODO)

### Packages storage related

#### STORAGE
Type of STORAGE
* container (Default)
* volume
* nfs

#### STORAGE_DATA_PATH
Data path inside container.
Defaults to: `/data`

#### STORAGE_NFS_HOST
In case STORAGE is `nfs`, you must specify which server it should connect into.
Defaults to: `nfs-server`

#### STORAGE_NFS_PATH
In case STORAGE is `nfs`, you must specify which folder it is placed.
Defaults to: `sinopia`

#### STORAGE_S3_ENDPOINT
In case STORAGE is `s3`, you must specify the API KEY.
Defaults to: `s3.amazonaws.com`

#### STORAGE_S3_API_KEY
In case STORAGE is `s3`, you must specify the API KEY.

#### STORAGE_S3_SECRET_KEY
In case STORAGE is `s3`, you must specify the API KEY.

#### STORAGE_S3_BUCKET
In case STORAGE is `s3`, you must specify the bucket.
Defaults to: `sinopia-storage`

### Port listening related

#### LISTEN
Space delimited paths
Defaults to: `0.0.0.0:4873`

##### Acceptable values:
* `0.0.0.0:4873` - listen on all addresses (INADDR_ANY)
* `localhost:4873` - listen as localhost
* `http://localhost:4873` - same thing
* `https://example.org:4873` - if you want to use https
* `[::1]:4873` - ipv6
* `unix:/tmp/sinopia.sock` - unix socket


## Development

### Launch an instance
```bash
make run
```

### I'm getting permissions error??!?
```bash
make fix-permissions
```
