# FlutterのDockerイメージを指定
FROM cirrusci/flutter:latest

# 非rootユーザーを作成
RUN useradd -m flutteruser
USER flutteruser  # ここで非rootユーザーに切り替え

# 作業ディレクトリを設定
WORKDIR /app

# アプリケーションのコードをコピー
COPY --chown=flutteruser:flutteruser . /app

# Flutterの依存関係を取得
RUN flutter pub get

# アプリケーションを起動
CMD ["flutter", "run", "-d", "web-server", "--web-port=8080"]