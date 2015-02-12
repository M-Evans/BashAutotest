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

test:
	@chmod +x $(SRC_DIR)/$(INSTALL_NAME)
	@clear
	$(SRC_DIR)/$(INSTALL_NAME) tests/exampleInput

sanetest:
	@chmod +x demo/bashi1.sh
	@clear
	demo/bashi1.sh

