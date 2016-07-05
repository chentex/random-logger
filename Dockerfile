FROM alpine
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]