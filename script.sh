#!/bin/bash

# Update package lists
sudo apt update

# Install pip3 and pipx
sudo apt install python3-pip -y
sudo apt install pipx -y

cd ~

# Install nmap
sudo apt install nmap -y

# Install Go
sudo apt install golang-go -y


# Install gowitness
git clone https://github.com/sensepost/gowitness.git
cd gowitness
make
cd ..

# Install WitnessMe
sudo python3 -m pip install --user pipx
pipx install witnessme
pipx ensurepath

# Install gobuster
git clone https://github.com/OJ/gobuster.git
cd gobuster
go get && go build
go install
cd ..
# Install ffuf
git clone https://github.com/ffuf/ffuf ; cd ffuf ; go get ; go build
cd ..

# Install Nikto
sudo apt install -y nikto

# Install Proxychains
sudo apt install proxychains4 -y

# Install Proxy-ng
git clone https://github.com/jamesbcook/proxy-ng.git
cd proxy-ng
make
wget https://github.com/jamesbcook/proxy-ng/releases/download/0.2.0/proxy-ng-linux
chmod +x proxy-ng-linux
cd ..

# Create file with notes
cd ~
touch notes.txt
echo "Installed the following: nmap, gobuster, proxy-ng, proxychains4, nikto, WitnessMe, gowitness, ffuf, Go, pip3 and pipx." > notes.txt
