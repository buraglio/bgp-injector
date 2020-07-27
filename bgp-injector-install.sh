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
apt update
apt install -y gobgpd

scho "create a high level folder called bgp-injector"

if [[ ! -e bgp-injector/ ]]; then
    mkdir -p route-tables/EU/Amsterdam/


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

echo "Grab latest route table from Amsterdam"
mkdir -p route-tables/EU/Amsterdam/
curl http://data.ris.ripe.net/rrc00/latest-bview.gz -o route-tables/EU/Amsterdam/latest-bview.gz
#zcat updates.20200723.1835.gz | bgpdump -m - > ISP1-Europe-Amsterdam-July-2020

echo "Grab latest route table from London"
curl http://data.ris.ripe.net/rrc01/latest-bview.gz -o route-tables/EU/London/latest-bview.gz
#zcat updates.20200723.1840.gz | bgpdump -m - > ISP1-Europe-London-July-2020

echo "Grab latest route table from Singapore"
curl http://data.ris.ripe.net/rrc23/latest-bview.gz  -o route-tables/Asia/Singapore/latest-bview.gz
#zcat updates.20200723.1840.gz | bgpdump -m - > ISP3-Asia-Singapore-July-2020

echo "Grab latest route table from Sao Paulo"
curl http://data.ris.ripe.net/rrc15/latest-bview.gz  -o route-tables/SouthAmerica/SaoPaulo/latest-bview.gz
#zcat updates.20200723.1840.gz | bgpdump -m - > ISP4-SouthAmerica-SaoPaulo-July-2020

echo "Grab latest route table from New York"
curl http://data.ris.ripe.net/rrc11/latest-bview.gz -o route-tables/US/NewYork/latest-bview.gz
#zcat updates.20200723.1840.gz | bgpdump -m - > ISP5-NorthAmerica-NewYork-July-2020

echo "Grab latest route table from Palo Alto"
curl http://data.ris.ripe.net/rrc14/latest-bview.gz -o route-tables/US/PaloAlto/latest-bview.gz
#zcat updates.20200723.1845.gz | bgpdump -m - > ISP6-NorthAmerica-PaloAlto-July-2020

echo "Grab latest route table from Johannasburg"
curl http://data.ris.ripe.net/rrc19/latest-bview.gz -o route-tables/Africa/JoBurg/latest-bview.gz
#zcat updates.20200723.1845.gz | bgpdump -m - > ISP7-Africa-JoBerg-July-2020
