rm index.txt
rm serial
touch index.txt
echo 01 > serial
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
kubectl create secret generic openvpn --from-file=dh.pem=./dh2048.pem --from-file=certs.p12=client.p12
kubectl create -f openvpn-controller.yaml
kubectl create -f openvpn-service.yaml
#kubectl get secret openvpn
