FROM alpine:3.16.1

ARG USER=version-checker
ARG UID=1000
ARG GID=1000

RUN adduser ${USER} -u ${UID} -D
RUN apk --no-cache add curl jq
ADD ./check_version.sh /check_version.sh
RUN chown ${UID}:${GID} /check_version.sh
RUN chmod a+x /check_version.sh

USER ${UID}:${GID}

CMD ["/check_version.sh"]
