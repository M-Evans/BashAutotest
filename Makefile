NAME=bat
SRC_DIR=src/
INSTALL_DIR=/usr/local/bin/
BASH_TEST=tests/bashInput
RSHELL_TEST=tests/bashInput
TEST_DELAY=700000

help:
	@echo -e "** Installation options:"
	@echo -e "Run \"make install\" to install"
	@echo -e "Run \"make reinstall\" to reinstall"
	@echo -e "Run \"make uninstall\" to uninstall"
	@echo -e "** Other options:"
	@echo -e "Run \"make testBash\" to run bat with the bash tests"
	@echo -e "Run \"make testRshell\" to run bat with the rshell tests"

install:
	@echo "Installing..."
	@if [ ! -e "$(SRC_DIR)$(NAME)" ]; \
	then \
	  echo "Failure. Where did the repo's executable go?"; \
	  exit 1;\
	fi
	@chmod +x "$(SRC_DIR)$(NAME)"
	@if [ ! -e "$(INSTALL_DIR)$(NAME)" ]; then \
	  cp "$(SRC_DIR)$(NAME)" "$(INSTALL_DIR)$(NAME)" &>/dev/null \
	    && echo "Success" \
	    || { echo "Failure (can't write there?)"; exit 1; }; \
	else \
	  echo "Failure (already installed?)"; \
	  exit 1; \
	fi

reinstall:
	@echo "Reinstalling..."
	@if [ ! -e "$(SRC_DIR)$(NAME)" ]; \
	then \
	  echo "Failure. Where did the repo's executable go?"; \
	  exit 1;\
	fi
	@chmod +x "$(SRC_DIR)$(NAME)"
	@cp "$(SRC_DIR)$(NAME)" "$(INSTALL_DIR)$(NAME)" &>/dev/null \
	  && echo "Success" \
	  || { echo "Failure (can't write there?)"; exit 1; }; \

uninstall:
	@echo "Uninstalling..."
	@if [ -f "$(INSTALL_DIR)$(NAME)" ]; \
	then \
	  rm -f "$(INSTALL_DIR)$(NAME)" &>/dev/null \
	    && echo "Success!" \
	    || { echo "Failure (can't delete there?)"; exit 1; }; \
	else \
	  echo "Failure (not installed?)"; \
	  exit 1; \
	fi

testBash:
	@chmod +x $(SRC_DIR)$(NAME)
	$(SRC_DIR)$(NAME) bash $(BASH_TEST) $(TEST_DELAY)

testRshell:
	@chmod +x $(SRC_DIR)$(NAME)
	$(SRC_DIR)$(NAME) rshell $(RSHELL_TEST) $(TEST_DELAY)


