#!/bin/bash
# A simple script to grab the latest RIPE BGP route table dumps
# created by buraglio@forwardingplane.net
# https://www.forwardingplane.net
echo" "
echo" "
echo "##################################################################"
echo "This script will install goBGP and create the directory"
echo "structure for using it as a route server for MRT files"
echo "It assumed ubuntu 18 or newer"
echo "please note that consuming and re-advertising a full table feed"
echo "from RIPE will require a significant amount of memory (16G is recommended)"
echo "##################################################################"
echo" "
echo" "
echo" "
echo "################################"
echo "install gobgp, curl"
echo "################################"
echo" "
echo" "
echo" "
sudo apt update
sudo apt install -y gobgpd curl
echo" "
echo" "
echo "################################"
echo "grab example gobgpd.conf"
echo "################################"
echo" "
echo" "
curl https://raw.githubusercontent.com/buraglio/bgp-injector/master/gobgpd.conf -o gobgpd.conf

echo "################################"
echo "Create directories for each route table if they don't exist"
echo "################################"
echo" "
echo" "
echo" "
echo" "

createDir(){
	if [ ! -d route-tables/EU/Amsterdam/ ]
	then
		/bin/mkdir -p $1 >/dev/null 2>&1 && echo "Directory $1 created." ||  echo "Error: Failed to create $1 directory."
	else
		echo "Error: $1 directory exits!"
	fi
}
createDir(){
	if [ ! -d route-tables/EU/London/ ]
	then
		/bin/mkdir -p $1 >/dev/null 2>&1 && echo "Directory $1 created." ||  echo "Error: Failed to create $1 directory."
	else
		echo "Error: $1 directory exits!"
	fi
}
createDir(){
	if [ ! -d route-tables/Asia/Singapore/ ]
	then
		/bin/mkdir -p $1 >/dev/null 2>&1 && echo "Directory $1 created." ||  echo "Error: Failed to create $1 directory."
	else
		echo "Error: $1 directory exits!"
	fi
}
createDir(){
	if [ ! -d route-tables/SouthAmerica/SaoPaulo/ ]
	then
		/bin/mkdir -p $1 >/dev/null 2>&1 && echo "Directory $1 created." ||  echo "Error: Failed to create $1 directory."
	else
		echo "Error: $1 directory exits!"
	fi
}
createDir(){
	if [ ! -d route-tables/US/NewYork/ ]
	then
		/bin/mkdir -p $1 >/dev/null 2>&1 && echo "Directory $1 created." ||  echo "Error: Failed to create $1 directory."
	else
		echo "Error: $1 directory exits!"
	fi
}
createDir(){
	if [ ! -d route-tables/US/PaloAlto/ ]
	then
		/bin/mkdir -p $1 >/dev/null 2>&1 && echo "Directory $1 created." ||  echo "Error: Failed to create $1 directory."
	else
		echo "Error: $1 directory exits!"
	fi
}
createDir(){
	if [ ! -d route-tables/Africa/JoBurg/ ]
	then
		/bin/mkdir -p $1 >/dev/null 2>&1 && echo "Directory $1 created." ||  echo "Error: Failed to create $1 directory."
	else
		echo "Error: $1 directory exits!"
	fi
}

# Uncomment the latest route table dump files for user
echo "##################################################################"
echo "Grab latest route table from Amsterdam"
echo "##################################################################"
mkdir -p route-tables/EU/Amsterdam/
curl -o - http://data.ris.ripe.net/rrc00/latest-bview.gz | gunzip > route-tables/EU/Amsterdam/latest-bview

echo "##################################################################"
echo "Grab latest route table from London"
curl -o - http://data.ris.ripe.net/rrc01/latest-bview.gz | gunzip > route-tables/EU/London/latest-bview
echo "##################################################################"

echo "##################################################################"
echo "Grab latest route table from Singapore"
echo "##################################################################"
curl -o - http://data.ris.ripe.net/rrc23/latest-bview.gz | gunzip > route-tables/Asia/Singapore/latest-bview

echo "##################################################################"
echo "Grab latest route table from Sao Paulo"
echo "##################################################################"
curl -o - http://data.ris.ripe.net/rrc15/latest-bview.gz | gunzip > route-tables/SouthAmerica/SaoPaulo/latest-bview.gz

echo "##################################################################"
echo "Grab latest route table from New York"
echo "##################################################################"
curl -o - http://data.ris.ripe.net/rrc11/latest-bview.gz | gunzip > route-tables/US/NewYork/latest-bview.gz

echo "##################################################################"
echo "Grab latest route table from Palo Alto"
echo "##################################################################"
curl -o - http://data.ris.ripe.net/rrc14/latest-bview.gz | gunzip > route-tables/US/PaloAlto/latest-bview.gz

echo "##################################################################"
echo "Grab latest route table from Johannasburg"
echo "##################################################################"
curl -o - http://data.ris.ripe.net/rrc19/latest-bview.gz | gunzip > route-tables/Africa/JoBurg/latest-bview.gz
