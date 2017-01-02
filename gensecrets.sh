openssl dhparam -out dh2048.pem 2048
export KEY_CONFIG=openssl.cnf
export KEY_DIR=./
export KEY_SIZE=2048
export KEY_COUNTRY=US
export KEY_PROVINCE=NY
export KEY_CITY=NY
export KEY_ORG=OB
export KEY_EMAIL=estevez.sebastian@gmail.com
export HOSTNAME=$(hostname)
./build-ca
./build-key-pkcs12 client
