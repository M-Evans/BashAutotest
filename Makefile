INSTALL_NAME=bat
SRC_DIR=src
INSTALL_DIR=/usr/local/bin

help:
	@echo -e "* Installation options:"
	@echo -e "Run \"make install\" to install"
	@echo -e "Run \"make reinstall\" to reinstall"
	@echo -e "Run \"make uninstall\" to uninstall"
	@echo -e "* Other options:"
	@echo -e "Run \"make sanetest\" to see if it's a good idea"
	@echo -e "    to install bat on your computer"
	@echo -e "Run \"make test\" to run bat with the provided testFile"

install:
	@echo "Installing..."
	@chmod +x src/install.sh
	@src/install.sh $(INSTALL_DIR) $(SRC_DIR) $(INSTALL_NAME)

reinstall:
	@echo "Reinstalling..."
	@chmod +x src/install.sh
	@src/install.sh $(INSTALL_DIR) $(SRC_DIR) $(INSTALL_NAME) -f

uninstall:
	@echo "Uninstalling..."
	@chmod +x src/uninstall.sh
	@src/uninstall.sh $(INSTALL_DIR) $(INSTALL_NAME)

testbash:
	@chmod +x $(SRC_DIR)/$(INSTALL_NAME)
	@clear
	$(SRC_DIR)/$(INSTALL_NAME) bash tests/bashInput

testrshell:
	@chmod +x $(SRC_DIR)/$(INSTALL_NAME)
	@clear
	@if [ ! -x bin/rshell ] ; then echo "ERROR: bin/rshell is not executable"; fi; exit 0
	$(SRC_DIR)/$(INSTALL_NAME) rshell tests/rshellInput

sanetest:
	@chmod +x demo/bashi1.sh
	@clear
	demo/bashi1.sh

