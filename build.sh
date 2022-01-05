docker build --output type=tar,dest=build.tar .
mkdir tmp
sudo mv build.tar ./tmp/build.tar
cd tmp 
tar –xvf build.tar
cd ..
sudo mv ./tmp/root/buildroot-2021.11/output/images/sdcard.img pielectricseagles_last.img
rm -rf build.tar
rm -rf tmp
