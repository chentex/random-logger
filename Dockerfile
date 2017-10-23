FROM alpine:3.6
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
