FROM cloudron/base:3.2.0@sha256:ba1d566164a67c266782545ea9809dc611c4152e27686fd14060332dd88263ea as build

ARG DRONE_VERSION=v2.12.1

WORKDIR /app/code
RUN wget https://github.com/harness/drone/archive/refs/tags/${DRONE_VERSION}.tar.gz
RUN tar -xvf ${DRONE_VERSION}.tar.gz --strip-components=1
RUN go build -tags "oss nolimit" github.com/drone/drone/cmd/drone-server


FROM cloudron/base:3.2.0@sha256:ba1d566164a67c266782545ea9809dc611c4152e27686fd14060332dd88263ea

RUN mkdir -p /app/code
WORKDIR /app/code

COPY --from=build /app/code/drone-server /app/code/
ADD drone.env /app/code/

COPY start.sh /app/pkg/

CMD [ "/app/pkg/start.sh" ]

