#!/bin/bash
# A simple script to grab the latest RIPE BGP route table dumps
# created by buraglio@forwardingplane.net
# https://www.forwardingplane.net

echo "This script will install goBGP and create the directory"
echo "structure for using it as a route server for MRT files"
echo "It assumed ubuntu 18 or newer"
echo "please note that consuming and re-advertising a full table feed"
echo "from RIPE will require a significant amount of memory (16G is recommended)"


echo "install gobgp"
sudo apt update
sudo apt install -y gobgpd curl

echo "grab example gobgpd.conf"
curl https://raw.githubusercontent.com/buraglio/bgp-injector/master/gobgpd.conf -o gobgpd.conf

echo "Create directories for each route table if they don't exist"
if [[ ! -e route-tables/EU/Amsterdam/ ]]; then
    mkdir -p route-tables/EU/Amsterdam/
if [[ ! -e route-tables/EU/London/ ]]; then
    mkdir -p route-tables/EU/London/
if [[ ! -e route-tables/Asia/Singapore/ ]]; then
    mkdir -p route-tables/Asia/Singapore/
if [[ ! -e rroute-tables/SouthAmerica/SaoPaulo/ ]]; then
    mkdir -p route-tables/SouthAmerica/SaoPaulo/
if [[ ! -e route-tables/US/NewYork/ ]]; then
    mkdir -p route-tables/US/NewYork/
if [[ ! -e route-tables/US/PaloAlto/ ]]; then
    mkdir -p route-tables/US/PaloAlto/
if [[ ! -e route-tables/Africa/JoBurg/ ]]; then
    mkdir -p route-tables/Africa/JoBurg/

# Uncomment the latest route table dump files for user

echo "Grab latest route table from Amsterdam"
mkdir -p route-tables/EU/Amsterdam/
curl -o - http://data.ris.ripe.net/rrc00/latest-bview.gz | gunzip > route-tables/EU/Amsterdam/latest-bview

echo "Grab latest route table from London"
curl -o - http://data.ris.ripe.net/rrc01/latest-bview.gz | gunzip > route-tables/EU/London/latest-bview

echo "Grab latest route table from Singapore"
curl -o - http://data.ris.ripe.net/rrc23/latest-bview.gz | gunzip > route-tables/Asia/Singapore/latest-bview

echo "Grab latest route table from Sao Paulo"
curl -o - http://data.ris.ripe.net/rrc15/latest-bview.gz | gunzip > route-tables/SouthAmerica/SaoPaulo/latest-bview.gz

echo "Grab latest route table from New York"
curl -o - http://data.ris.ripe.net/rrc11/latest-bview.gz | gunzip > route-tables/US/NewYork/latest-bview.gz

echo "Grab latest route table from Palo Alto"
curl -o - http://data.ris.ripe.net/rrc14/latest-bview.gz | gunzip > route-tables/US/PaloAlto/latest-bview.gz

echo "Grab latest route table from Johannasburg"
curl -o - http://data.ris.ripe.net/rrc19/latest-bview.gz | gunzip > route-tables/Africa/JoBurg/latest-bview.gz
