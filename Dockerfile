# Ruby 3.3.0 の公式イメージをベースに使用（OpenSSL対応）
FROM ruby:3.3.0

# 必要なパッケージをインストール
# - build-essential: C拡張をビルドするために必要（bcrypt, pgなど）
# - libpq-dev: PostgreSQL 用 Cライブラリ（pg gem 用）
# - libssl-dev: OpenSSL ライブラリ（HTTPS通信やbcryptで使用）
# - postgresql-client: psqlコマンドなどの利用のため
RUN apt-get update -qq && \
  apt-get install -y \
  build-essential \
  libpq-dev \
  libssl-dev \
  postgresql-client && \
  rm -rf /var/lib/apt/lists/*

# bundler を Gemfile.lock に合わせたバージョンでインストール
RUN gem install bundler:2.5.22

# 作業ディレクトリを /app に設定
WORKDIR /app

# Gemfile と Gemfile.lock を先にコピー（Docker のキャッシュを効かせる）
COPY Gemfile Gemfile.lock /app/

# bundler で依存関係をインストール（バージョンを明示）
RUN bundle _2.5.22_ install

# 残りのアプリケーションファイルをすべてコピー
COPY . /app

# Sinatra アプリが使用するポートを公開（Docker外部からアクセス可能にする）
EXPOSE 4567

# Sinatra アプリのエントリーポイント（rackup 経由で config.ru を実行）
# -p: ポート指定、-o: バインドアドレス（0.0.0.0 は全てのIPアドレスに対応）
# docker-compose 側に command がある場合はこの CMD は無視される
CMD ["bundle", "exec", "rackup", "-p", "4567", "-o", "0.0.0.0", "config/config.ru"]
