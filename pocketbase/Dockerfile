FROM alpine:3.12

ADD https://github.com/pocketbase/pocketbase/releases/download/v0.23.12/pocketbase_0.23.12_linux_amd64.zip /tmp/pb.zip
RUN mkdir -p /pb && unzip /tmp/pb.zip -d /pb/ && chmod +x /pb/pocketbase

# Указание места для хранения данных
VOLUME /pb/pb_data

# Открытие порта
EXPOSE 8090

# Запуск PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]
