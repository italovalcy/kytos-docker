MAINTAINER Italo Valcy <italovalcy@gmail.com>

FROM kytos/nightly

RUN for napp in storehouse of_core flow_manager topology of_lldp pathfinder mef_eline maintenance; do git clone https://github.com/kytos/$napp;  cd $napp; python3.6 setup.py develop || true; cd ..; done

WORKDIR /
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 6653
EXPOSE 8181

ENTRYPOINT ["/docker-entrypoint.sh"]
