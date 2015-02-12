# bashAutotest

### Description
bashAutotest is a utility for running tests on shells and programs. Currently, it is tailored to accommodate UCR CS100 students, but it can be useful elsewhere.

### How it works
A file is read one line at a time. For each line, it redirects the content to ``bash`` in interactive mode. The redirected content gets echoed to the screen and then executed.

### Installation
```bash
git clone https://github.com/m-evans/bashAutotest.git
cd bashAutotest.git
sudo make install
```
To see the installation options, run ``make`` or ``make help``. You can modify the installation directory in the Makefile and verify the installation scripts in the ``src`` directory.

### Usage
```
bat pathToTestFile
```

### TODO
* Make it work for bash major version 3. From what I can tell, it only works for bash major version 4+. (easy)
* Pass in the delay as an optional argument. (medium)
* Implement pausing so the tests can be stepped through. (hard)

### Bugs
* If the processes *happen* to be out of order when ps is called, the wrong process will be checked for children, and output may not be properly written in some cases. They're sorted by start time, though, so I doubt this will go wrong. I don't know enough about ps and processes to confirm this, however.

### FAQ
* What can this utility help me test?

    Pretty much anything you can type.
* How do I know if it will work on my system?

    Run ``make sanetest``! If you can see the comments, it'll work. If you don't see any comments, but there are a lot of prompts printing, it will not work for you. See demo/bashi3.sh for info on how to fix the problem.
* What if one of the lines of the testFile starts another program that's still around for the next line of input?

    This is how the program is tailored for the CS100 course; it's assumed that the subprocess does **not** print stdin back to the screen, and takes care of it manually. If the subprocess does print stdin back to the screen, it will be printed twice.

