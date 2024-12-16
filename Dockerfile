FROM ubuntu:latest
RUN useradd -u 5000 collin && \
    useradd sync && \
    useradd nobody
RUN mkdir /structure && \
    chmod 777 /structure
USER sync
RUN touch /structure/sync-work
USER nobody
RUN touch /structure/nobody-work
USER root

CMD ["while true; do echo users; done"]