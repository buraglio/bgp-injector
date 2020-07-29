# A simple script to grab the latest RIPE BGP route table dumps

## This script assumes a few things:

* Ubuntu 18 or newer
* Understanding of BGP
* A reasonable amount of horsepower and memory to hand to the device consuming the table dump files.
* I run this on a VM with 16G of RAM.

## Important notes
* Each update file is quite large. After uncompressing some may be ~6G
* Adjust the shell script to account for how many of the route tables you'll actually need.
* Downloading and updating all 7 of the route tables may take quite some time
* For example, adding a full table from a RIPE MRT file will take literally days. There may be a better way to do this, but I have not found it.  

## Usage
```
   git clone https://github.com/buraglio/bgp-injector.git
   cd bgp-injector
   chmod +x bgp-injector-install.sh
   ./bgp-injector-install.sh
   vi gobgpd.conf # Make any necessary adjustments
   sudo gobgpd -f gobgpd.conf
   sudo gobgp mrt inject global route-tables/EU/Amsterdam/<filename>
```
