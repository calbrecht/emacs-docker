FROM evm/emacs-base
ARG EMACS_VERSION

RUN evm install $EMACS_VERSION --use || true

RUN mkdir /data
VOLUME /data
WORKDIR /data

ENTRYPOINT ["emacs"]
CMD ["--version"]
