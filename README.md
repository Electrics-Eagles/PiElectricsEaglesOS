# PiElectricsEaglesOS
Small Linux based distibrution for PiElectricsEagles drone.

For build : 
Install docker and git . for your os .
Clone repo using git 
```
git clone https://github.com/Electrics-Eagles/PiElectricsEaglesOS
```
Grab lot of coffee , films whatever you like ... build can take up one hour

finnaly build with docker assume that you care in source code directory:
```
docker build --output type=tar,dest=file.tar .
```
or better use ready to go script : build.sh
just 
```
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/build.sh | bash
```
