#!/bin/bash
# A simple script to grab the latest RIPE BGP route table dumps
# created by buraglio@forwardingplane.net
# https://www.forwardingplane.net
echo " "
echo " "
echo "##################################################################"
echo "This script will install goBGP and create the directory"
echo "structure for using it as a route server for MRT files"
echo "It assumed ubuntu 18 or newer"
echo "please note that consuming and re-advertising a full table feed"
echo "from RIPE will require a significant amount of memory (16G is recommended)"
echo "##################################################################"
echo " "
echo " "
echo " "
echo "################################"
echo "install gobgp, curl"
echo "################################"
echo " "
echo " "
echo " "
sudo apt update
sudo apt install -y gobgpd curl
echo " "
echo " "
echo "################################"
echo "grab example gobgpd.conf"
echo "################################"
echo " "
echo " "
curl https://raw.githubusercontent.com/buraglio/bgp-injector/master/gobgpd.conf -o gobgpd.conf


# Uncomment the latest route table dump files for user
echo "##################################################################"
echo "Grab latest route table from Amsterdam"
echo "##################################################################"
mkdir -p route-tables/EU/Amsterdam/
curl -o - http://data.ris.ripe.net/rrc00/latest-bview.gz | gunzip > route-tables/EU/Amsterdam/latest-bview

echo "##################################################################"
echo "Grab latest route table from London"
echo "##################################################################"
mkdir -p route-tables/EU/London/
curl -o - http://data.ris.ripe.net/rrc01/latest-bview.gz | gunzip > route-tables/EU/London/latest-bview

echo "##################################################################"
echo "Grab latest route table from Singapore"
echo "##################################################################"
mkdir -p route-tables/Asia/Singapore/
curl -o - http://data.ris.ripe.net/rrc23/latest-bview.gz | gunzip > route-tables/Asia/Singapore/latest-bview

echo "##################################################################"
echo "Grab latest route table from Sao Paulo"
echo "##################################################################"
mkdir -p route-tables/SouthAmerica/SaoPaulo/
curl -o - http://data.ris.ripe.net/rrc15/latest-bview.gz | gunzip > route-tables/SouthAmerica/SaoPaulo/latest-bview.gz

echo "##################################################################"
echo "Grab latest route table from New York"
echo "##################################################################"
mkdir -p route-tables/US/NewYork/
curl -o - http://data.ris.ripe.net/rrc11/latest-bview.gz | gunzip > route-tables/US/NewYork/latest-bview.gz

echo "##################################################################"
echo "Grab latest route table from Palo Alto"
echo "##################################################################"
mkdir -p route-tables/US/PaloAlto/
curl -o - http://data.ris.ripe.net/rrc14/latest-bview.gz | gunzip > route-tables/US/PaloAlto/latest-bview.gz

echo "##################################################################"
echo "Grab latest route table from Johannasburg"
echo "##################################################################"
mkdir -p route-tables/Africa/JoBurg/
curl -o - http://data.ris.ripe.net/rrc19/latest-bview.gz | gunzip > route-tables/Africa/JoBurg/latest-bview.gz
