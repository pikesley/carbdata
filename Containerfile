FROM python:3.10

ARG PROJECT
WORKDIR /opt/${PROJECT}

COPY ./ /opt/${PROJECT}

RUN python -m pip install -r requirements.txt

COPY container-config/bashrc /root/.bashrc
COPY ./container-config/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]
