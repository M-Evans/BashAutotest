# bashAutotest

### Description
``bashAutotest`` is a utility for running tests on shells and programs. It is tailored to accommodate UCR's CS100 students, but it can be useful elsewhere.

### Installation
```bash
git clone https://github.com/m-evans/bashAutotest.git
cd bashAutotest.git
sudo make install
```
To see the installation options, run ``make`` or ``make help``. You can modify the installation directory, install name, and other options in the Makefile.

### Usage
```
bat mode testFile[s] [delay]
```

If you would like to learn more about the features, check out the tutorial folder's readme

### Bugs
* Bash doesn't send signals to subprocesses in interactive non-user tty mode, so signals specified in test files, when sent to bash, do not work.

