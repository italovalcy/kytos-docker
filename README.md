# kytos-docker
Kytos SDN Controller in a docker environment with Apache proxy and authentication

To run the docker-compose:

      docker-compose up -d

Then you go to the browser and access https://IP_DOCKER_SERVER/

To build and run only kytos (-E option enable all kytos models - switches, links, interfaces):

      docker build -t italovalcy/kytos .
      docker run --name kytos1 -d -p 6653:6653 italovalcy/kytos -E

To build and run the apache proxy (after start kytos as detailed above):

      docker build -t italovalcy/apache:latest -f Dockerfile-apache .
      KYTOS_IP=$(docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kytos1)
      docker run -d --name apache1 -p 8443:443 --env KYTOS_SERVER=$KYTOS_IP italovalcy/apache:latest
