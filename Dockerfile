# FlutterのDockerイメージを指定
FROM cirrusci/flutter:latest

# 作業ディレクトリを設定
WORKDIR /app

# 非rootユーザーを作成
RUN useradd -m flutteruser

# アプリケーションのコードをコピー
COPY --chown=flutteruser:flutteruser . /app

# USERを変更する前に依存関係を取得
RUN flutter pub get

# 非rootユーザーに切り替え
USER flutteruser

# アプリケーションを起動
CMD ["flutter", "run", "-d", "web-server", "--web-port=8080"]
