FROM golang:1.22 as builder

WORKDIR /app

COPY . .

ENV GOOS=linux 
ENV GOARC=386

RUN go mod download 
RUN go build -o alpo-blog

#FROM alpine:latest

#RUN apk --no-cache add curl

# Устанавливаем рабочую директорию
#WORKDIR /root/

# Копируем собранное приложение из предыдущего этапа
#COPY --from=builder /app/alpo-blog .
#COPY --from=builder /app/web ./web

# Сообщаем Docker, что нужно использовать этот порт
EXPOSE 8686 

ENTRYPOINT ["./alpo-blog"]



#docker buildx build --platform linux/amd64 -t lcash/alpo-blog . --push
