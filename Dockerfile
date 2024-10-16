FROM cirrusci/flutter:latest
WORKDIR /app
COPY . /app
RUN flutter pub get
CMD ["flutter", "run", "-d", "web-server"]
