INSTALL_NAME=bat
SRC_DIR=src
INSTALL_DIR=/usr/local/bin

help:
	@echo -e "Type \"make install\" to install"
	@echo -e "Type \"make reinstall\" to reinstall"
	@echo -e "Type \"make uninstall\" to uninstall"

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

