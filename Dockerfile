
FROM oziproject/supported-python:2023
COPY action.sh .
RUN chmod +x action.sh
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends git \
  && rm -rf /var/lib/apt/lists/* \
  && rm -f /var/cache/apt/archives/*.deb
RUN git clone https://github.com/OZI-Project/pyc_wheel /pyc_wheel
RUN /root/.pyenv/versions/$(/root/.pyenv/bin/pyenv latest 3.12)/bin/python -m pip install ./pyc_wheel
ENTRYPOINT ["bash", "action.sh"]