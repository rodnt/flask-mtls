#!/bin/bash

echo 'Generate the CA Key and Certificate'
openssl genrsa -out ca.key 2048
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt -subj "/CN=My CA"

echo 'Generate the Server Key and Certificate Request'
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -subj "/CN=localhost"

echo 'Sign the Server Certificate with the CA'
openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

echo 'Generate the Client Key and Certificate Request'
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/CN=Client"

echo 'Sign the Client Certificate with the CA'
openssl x509 -req -days 3650 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 02 -out client.crt
