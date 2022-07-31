FROM cloudron/base:3.2.0@sha256:ba1d566164a67c266782545ea9809dc611c4152e27686fd14060332dd88263ea

RUN mkdir -p /app/code
WORKDIR /app/code

COPY start.sh /app/pkg/

CMD [ "/app/pkg/start.sh" ]

