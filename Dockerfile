FROM python:3.6.9-alpine as base
FROM base as builder

RUN mkdir /install
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install -v --no-cache-dir \
	--install-option="--prefix=/install" -r /requirements.txt


FROM base

LABEL maintainer="Brad Campbell <b@bradcod.es>"
LABEL description="Minimal Python w/ psycopg2"
LABEL "based on"="https://github.com/psycopg/psycopg2/issues/684#issuecomment-453803835"

RUN mkdir /app
COPY --from=builder /install /usr/local
RUN apk --no-cache add libpq
WORKDIR /app
ENTRYPOINT [ "python" ]