Docker Compose setup for SvelteKit

Manage project via Docker Container
$ docker-compose --verbose build

$ docker-compose up --detach

Note, first time build? add -V, --renew-anon-volumes to docker-compose up

Recreate anonymous volumes instead of retrieving data from the previous containers.
