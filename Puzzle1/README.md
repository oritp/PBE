# Puzzle1
The _puzzle1.rb_ file contains the Ruby code to work with the Itead PN532 NFC RFID module.

For the correct operation of the program, the Ruby gem _ruby-nfc_ is essential.
In addition, this gem requires the installation of several tools and libraries.
You will find them below:

- **autoconf, automake, git, libtool, libss1-dev, pkg-config:** `sudo apt-get install autoconf automake git libtool libssl-dev pkg-config`
- **libusb-dev:** `sudo apt-get install libusb-dev`
- **libnfc:** clone https://github.com/nfc-tools/libnfc.git or `sudo apt-get install libnfc-dev`
- **libfreefare:** clone https://github.com/nfc-tools/libfreefare.git or `sudo apt-get install libfreefare-dev`

Finally, install the Ruby gem: `sudo gem install ruby-nfc` 
