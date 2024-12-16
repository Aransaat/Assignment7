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
FROM alpine:latest
RUN mkdir /structure && chmod 777 /structure
RUN touch /structure/sync-work && chown sync /structure/sync-work
RUN touch /structure/nobody-work && chown nobody /structure/nobody-work
RUN adduser -D -u 5000 collin
CMD ["sh", "-c", "while true; do echo users; done"]
