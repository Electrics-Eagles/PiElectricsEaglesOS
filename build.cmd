cd C:\Users\payan\Documents\GitHub\PiElectricsEaglesOS
mkdir out
docker  --mount type=tmpfs,destination=./out build . -t img.img


