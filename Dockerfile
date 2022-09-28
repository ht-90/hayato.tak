FROM klakegg/hugo:0.101.0-ubuntu

ENV HUGO_BIND="0.0.0.0" \
    HUGO_DESTINATION="/public" \
    HUGO_ENV="DEV"

RUN apt update \
 && apt install -y bash-completion \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /etc/bash_completion.d \
 && hugo gen autocomplete > /dev/null

WORKDIR /src

ENTRYPOINT [ "hugo", "server", "--port=1515" ]
