FROM python:3.9-bullseye

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

### install and setup pyenv
ENV PYENV_ROOT=/pyenv
ENV PATH="/pyenv/bin:${PATH}"
RUN curl https://pyenv.run | bash
RUN eval "$(pyenv init -)"
RUN pyenv update
RUN pyenv install 3.9.18 
RUN pyenv install 3.10.13
RUN pyenv install 3.11.7
RUN pyenv install 3.12.1
RUN pyenv global 3.9.18 3.10.13 3.11.7 3.12.1
# hadolint ignore=SC2016
RUN printf 'export PYENV_ROOT=/pyenv\neval "$(pyenv init --path)"\neval "$(pyenv init - --no-rehash)"\n' >> /bashrc
