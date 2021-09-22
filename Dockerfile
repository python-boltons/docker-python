FROM python:3.9-bullseye

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

### install and setup pyenv
ENV PYENV_ROOT=/pyenv
ENV PATH="/pyenv/bin:${PATH}"
RUN curl https://pyenv.run | bash
RUN eval "$(pyenv init -)"
RUN pyenv install 3.7.12
RUN pyenv install 3.8.12
RUN pyenv install 3.9.7
RUN pyenv global 3.9.7 3.8.12 3.7.12
# hadolint ignore=SC2016
RUN printf 'export PYENV_ROOT=/pyenv\nexport PATH=$PYENV_ROOT/bin:$PATH\neval "$(pyenv init -)"\n' >> /bashrc
