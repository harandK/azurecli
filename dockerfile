FROM alpine

RUN apk update && \
  apk add bash py3-pip docker bash-completion docker-bash-completion && \
  apk add --virtual=cache gcc libffi-dev musl-dev openssl-dev python3-dev make && \
  pip3 --no-cache-dir install -U pip && \
  pip3 --no-cache-dir install azure-cli && \
  apk del --purge cache


RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
RUN echo "source /etc/profile.d/bash_completion.sh" >> /root/.bashrc

ENTRYPOINT ["bash"]
