# Multi-stage build docker file

# app build stage
FROM docker.io/library/golang:1.23-alpine as builder
RUN mkdir /build

# 1. Skopirovat zdrojove kody aplikacie do adresara /build, ktory sa vytvoril v predchadzajucom kroku
COPY . /build

# 2. Nastavit adresar /build ako pracovny adresar (work directory)
WORKDIR /build

RUN CGO_ENABLED=0 GOOS=linux go build -a -o main .

# image build image - use scratch to get smallest possible size of an image
FROM scratch

# 1. Pridat prikaz, ktory skopiruje zo stage builder subor: /build/main do adresara /app/
COPY --from=builder /build/main /app/

# 2. Nastavit pracovny adresar (work directory) na: /app
WORKDIR /app

# 3. Pridat instrukciu, ktora zabezpeci, ze po vytvoreni kontajnera sa spusti aplikacia (tj. ./main)
CMD ["./main"]
