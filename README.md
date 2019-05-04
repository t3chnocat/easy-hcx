## Easy-HCX

Easy-HCX is a menu driven script written around hcxtools, hcxdumptool and hashcat. Its goal is not to automate everything, just to make common tasks easier. 

hcxtools, hcxdumptools and hashcat are very deep programs with tons of options so Easy-HCX only covers some of their basic functions including:  
  
  * preparing your wireless interface for captures
  * capturing WPA2 handshakes and/or PMKIDs, optionally without deauthenticating clients for stealth or to avoid disrupting clients
  * convert capture files to Hashcat's .hccapx or .16800 formats
  * viewing information about capture files 
  * use hashcat to perform dictionary attacks on .hccapx or .16800 files
 
### Hardware Requirements:
  * A wireless interface that supports monitor mode
  * A GPU that Hashcat can use

### Software Requirements:
  * hcxdumptool
  * hcxtools
  * hashcat

### Tested with:
  * hcxdumptool 5.1.4
  * hcxtools 5.1
  * hashcat 5.1.0
  * Kali linux 64 bit

User variables are set in easy-hcx.sh. Make sure you look these over.

### Notes:
hcxdumptools' documentation states that it randomizes MAC addresses and handles monitor mode on its own. It also states not to use it on logical interfaces and to leave the physical interface in managed mode. 03_easy-hcx-capture-targeted does manually re-enable monitor mode - this is because after using hcxdumptool to get a list of APs, I found that running hcxdumptool again immediately afterwards would fail inconsistently with error messages saying the interface was busy.

### Link to demo video
[![Demo Video](http://i3.ytimg.com/vi/zJHD1ttgaxw/hqdefault.jpg)](https://youtu.be/zJHD1ttgaxw)

