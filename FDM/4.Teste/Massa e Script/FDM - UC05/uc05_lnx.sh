#!/usr/bin/env bash

URL="http://localhost:8081/fdm/produtos"

echo "Veja Roteiro de Teste para mais detalhes\n"
echo "=== Teste 1 - GET all ==="
curl -X 'GET' "$URL" \
  -H 'accept: */*'
echo -e "\n"

echo "=== Teste 2 - POST um produto ==="
curl -X 'POST' "$URL" \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "id": 1,
  "nome": "tnome",
  "descricao": "tdescricao",
  "material": "tmaterial",
  "marca": "tmarca",
  "ativo": true,
  "imagemPrincipalUrl": "timg",
  "skus": [
    {
      "id": 1,
      "estoque": 1,
      "preco": 1,
      "especificacoes": {
        "additionalProp1": "tesp1",
        "additionalProp2": "tesp2",
        "additionalProp3": "tesp3"
      },
      "pesoGramas": 10,
      "codigoUniversal": "tcod",
      "alturaCm": 100,
      "larguraCm": 100,
      "comprimentoCm": 100
    }
  ],
  "categoria": {
    "id": 1,
    "nome": "tcategoria",
    "ativo": true
  }
}'
echo -e "\n"

echo "=== Teste 3 - GET por id ==="
curl -X 'GET' "$URL/1" \
  -H 'accept: */*'
echo -e "\n"


echo "=== Teste 4 - PUT por id  ==="
curl -X 'PUT' "$URL/1" \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "id": 1,
  "nome": "tnome2",
  "descricao": "tdescricao2",
  "material": "tmaterial2",
  "marca": "tmaterial2",
  "ativo": false,
  "imagemPrincipalUrl": "timg2",
  "skus": [
    {
      "id": 1,
      "estoque": 1,
      "preco": 1,
      "especificacoes": {
        "additionalProp1": "tesp1",
        "additionalProp2": "tesp2",
        "additionalProp3": "tesp3"
      },
      "pesoGramas": 10,
      "codigoUniversal": "tcod",
      "alturaCm": 100,
      "larguraCm": 100,
      "comprimentoCm": 100
    }
  ],
  "categoria": {
    "id": 1,
    "nome": "tcategoria",
    "ativo": true
  }
}'
echo -e "\n"
echo "> Confirmando o PUT"
curl -X 'GET' "$URL/1" \
  -H 'accept: */*'
echo -e "\n"


echo "=== Teste 5 - DELETE por id ==="
curl -X 'DELETE' "$URL/1" \
  -H 'accept: */*'
echo -e "\n"
echo "> Confirmando o DELETE"
curl -X 'GET' "$URL/1" \
  -H 'accept: */*'
echo -e "\n"

