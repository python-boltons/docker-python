FROM python:3.9-bullseye

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

### install and setup pyenv
RUN curl https://pyenv.run | bash
ENV PATH="/root/.pyenv/bin:${PATH}"
RUN eval "$(pyenv init -)"
RUN pyenv install 3.7.12
RUN pyenv install 3.8.12
RUN pyenv install 3.9.7
RUN pyenv global 3.9.7 3.8.12 3.7.12
# hadolint ignore=SC2016
RUN echo 'export PATH=$HOME/.pyenv/bin:$PATH' >> /bashrc
# hadolint ignore=SC2016
RUN echo 'eval "$(pyenv init -)"' >> /bashrc
