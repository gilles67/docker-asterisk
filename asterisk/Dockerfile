FROM ubuntu:22.04 as base

ENV DEBIAN_FRONTEND noninteractive

COPY app /app

RUN apt-get update -y && apt-get install -y --no-install-recommends make && make -C /app build



FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

COPY --from=base /app /app

RUN apt-get update -y && apt-get install -y --no-install-recommends make && make -C /app setup

EXPOSE 80
EXPOSE 5060/udp

CMD ["/app/sbin/asterisk", "-fvvv"]