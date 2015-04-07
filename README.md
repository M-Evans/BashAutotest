# bashAutotest

### This project is abandoned
### Update
This project is abandoned.
A more recent version of this script lives [here](https://github.com/mikeizbicki/ucr-cs100/tree/2015winter/scripts/cs100-runtests) under a different name (cs100-runtests).
This script uses a method of sending tests that does not work for sending control sequences such as ``Control+C``.
For a newer and better version of ``bashAutoTest`` that fixes these issues, see [here](https://github.com/M-Evans/runtests).


### Description
``bashAutotest`` is a utility for running tests on shells and programs. It is tailored to accommodate UCR's CS100 students, but it can be useful elsewhere.

### Installation
```bash
git clone https://github.com/m-evans/bashAutotest.git
cd bashAutotest
sudo make install
```
To see the installation options, run ``make`` or ``make help``. You can modify the installation directory, install name, and other options in the Makefile.

### Usage
```
bat mode testFile[s] [delay]
```

If you would like to learn more about the features, check out the tutorial folder's readme

### Bugs
* Because of the way bash is called, it doesn't send signals to subprocesses. The result is that signals specified in test files, when testing in bash mode, do not work. This is not a problem for rshells that properly handle signals.
