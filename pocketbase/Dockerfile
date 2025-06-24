FROM alpine:3.21

ADD https://github.com/pocketbase/pocketbase/releases/download/v0.28.4/pocketbase_0.28.4_linux_amd64.zip /tmp/pb.zip
RUN mkdir -p /pb && unzip /tmp/pb.zip -d /pb/ && chmod +x /pb/pocketbase

COPY ./pocketbase/pb_hooks /pb/pb_hooks
# Указание места для хранения данных
VOLUME /pb/pb_data

# Открытие порта
EXPOSE 8090

# Запуск PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]
