Docker Compose setup for SvelteKit

Manage project via Docker Container
$ docker-compose --verbose build     ## build the containers
$ docker-compose run                 ## run the containers
     --or--
$ docker-compose up                  ## build and run the containers as long as terminal is open.
                                     ## NOT FOR PRODUCTION!

$ docker-compose up --detach         ## build and run the containers in detached (-d) mode

Note, first time build? 
$ docker-compose up --renew-anon-volumes (-V) 
    ## Recreate anonymous volumes instead of retrieving data from the previous containers.
