FROM python:3.9-bullseye

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

### create new user account ('bryan')
RUN groupadd bryan && useradd -m -u 1000 -g bryan bryan
USER bryan

### install and setup pyenv
RUN curl https://pyenv.run | bash
ENV PATH="/home/bryan/.pyenv/bin:${PATH}"
RUN eval "$(pyenv init -)"
RUN pyenv install 3.7.12
RUN pyenv install 3.8.12
RUN pyenv install 3.9.7
RUN pyenv global 3.9.7 3.8.12 3.7.12
# hadolint ignore=SC2016
RUN echo 'export PATH=$HOME/.pyenv/bin:$PATH' >> "$HOME"/.bashrc
# hadolint ignore=SC2016
RUN echo 'eval "$(pyenv init -)"' >> "$HOME"/.bashrc

### let child Dockerfile set USER back to 'bryan'
USER root
