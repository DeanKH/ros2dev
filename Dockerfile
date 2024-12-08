FROM ${BASE_IMAGE:-osrf/ros}:${BASE_IMAGE_TAG:-humble-desktop-full} AS base

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=bind,source=dev-apt-packages.txt,target=dev-apt-packages.txt \
  apt-get update && \
  cat dev-apt-packages.txt | xargs apt-get install -y --no-install-recommends

COPY dev-pip-packages.txt /tmp/dev-pip-packages.txt
RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked \
  --mount=type=bind,source=dev-pip-packages.txt,target=dev-pip-packages.txt \
  pip install -r dev-pip-packages.txt


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
