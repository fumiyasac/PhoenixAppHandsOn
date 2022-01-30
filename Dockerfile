# 利用するElixirのバージョン指定＆OS指定(-slimは「Docker Slim」のこと)
# Docker Slim: https://github.com/docker-slim/docker-slim
FROM elixir:1.13.2-slim

# 作業用のディレクトリのパス指定
WORKDIR /app

# Dockerイメージを作成する際に実行するコマンド
RUN apt-get update && apt-get install -y \
  inotify-tools git npm && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Phoenixに関連するライブラリをアップデートするために実行するコマンド
RUN mix do \
  local.hex --force, \
  local.rebar --force, \
  archive.install --force hex phx_new