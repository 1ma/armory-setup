armory-setup
============

Rapid Armory setup for an Ubuntu 12.04 x64 Live USB


prerequisites / instructions
----------------------------

1. This installer is meant to be run on an Ubuntu 12.04 x64 Live USB

2. Connect to the internet

3. Enable ```universe``` and ```multiverse``` source origins in Software Sources
> Update Manager > Settings... > Ubuntu Software > Check ```universe``` and ```multiverse``` boxes

4. Put the Armory DEB package and the AESCrypt source archive in the ```setup.sh``` script folder, and make sure that the ```AESCRYPT_SOURCE``` and ```ARMORY_DEB``` bash variables point to them

5. Run the ```setup.sh``` script with root privileges


what the script does
--------------------

* Installs KeePass2 password manager
* Installs AESCrypt file encryption utility
* Installs Armory for Ubuntu 12.04 x64
* Disables all network interfaces


third party software
--------------------

* Get Armory .deb package from <https://bitcoinarmory.com/download/>
* Get AESCrypt source archive from <https://www.aescrypt.com/download/>
