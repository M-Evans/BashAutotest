# How to use ``bat``

## Contents
1. [``bat`` and ``hw0``](#hw0)
2. [``bat`` and ``hw1``](#hw1)
3. [``bat`` and ``hw2``](#hw2)
4. [``bat`` and ``hw3``](#hw3)

### ``hw0``
In [hw0](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you are required to create a basic shell that accepts commands and executes them. Additionally, you must implement ``&&``, ``||``, and ``;`` as connectors. Here's how you would test this using ``bat``:

```bash
bat rshell tests/exec
```

When using ``bat``, you first specify the mode you would like to use, then specify the file that holds the tests you'd like to run. ``tests/exec`` fron the previous exemple would look something like the following:

```bash
# this is a comment
# testing one command:
ls
# testing with one parameter:
ls -a
# testing with two parameters:
ls -a -l
# testing with three parameters:
ls -a -l -h

# test &&
true && echo true
# test ||
false || echo false
```

An important thing to note about your ``rshell`` is that it must exit when there is no more input to be had. If you're using ``cin``, ``cin.good()`` will return true if there isn't a problem with the ``cin`` stream. When ``bat`` is finished feeding lines of input to your ``rshell``, ``cin.good()`` will return false.

Another requirement for [hw0](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) is that you implement the ``exit`` command. Here's an example test file for ``exit`` in ``rshell``:

```bash
# test commented exit
#exit
# test spaces before commented exit
    #exit
# exit with parameters
exit with parameters and -flags and stuff

# none of this stuff will get passed!
foo -a
bar "hello world"
```

When ``rshell`` exits, the rest of the tests in the file will not get passed. Instead, there's a way to specify multiple files. If the tests directory looks like this:

```
tests-+
      |-execCommands
      |-execConnectors
      |-execExit_part1
      |-execExit_part2
      |-experiment
      |-filexecStuff
      `-hello
```

Then running ``bat rshell tests/exec`` will run your ``rshell`` with the ``execCommands``, ``execConnectors``, ``execExit_part1``, and ``execExit_part2`` files. ``bat`` will take the first part of the path you specify, and match it with everything that starts with that phrase. ``bat`` will fail on directories, however, so make sure it doesn't expand to include a directory.

### ``hw1``
In [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you're required to implement the ``ls`` command. Here's how you would test [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) using ``bat``:

```bash
bat bash tests/ls
```

The main difference between this and [``hw0``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) is the mode you're testing in. If you're testing ``rshell``, use the ``rshell`` testing mode. If you'd like to run your tests through ``bash``, use ``bash`` mode. For this assignment, you don't need to use ``rshell`` to test. You may use ``rshell`` to test it if you'd like by running ``bat rshell tests/ls`` instead, but it's not required.

Here's part of what an example test file named ``lsExampleTest`` would look like for this assignment:

```bash
# test regular ls
ls
# test ls -a
ls -a
# test ls -l
ls -l
# test ls -R
ls -R
```

### ``hw2``
In [``hw2``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you're required to implement several different piping and redirection features that use ``<``, ``>``, ``>>``, and ``|`` as part of their syntax. Here's how you would test [``hw2``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) using ``bat``:

```bash
bat rshell tests/piping
```

Here's part of what an example test file named ``pipingExampleTest`` would look like for this assignment:

```bash
# test output
ls > file
echo "hello world!" > input

# test input
cat < file
cat < input

# test appending output
ls > app
ls >> app
ls >> app
cat app

#test piping
echo "this is a pipe test" > pipeTest
cat < pipeTest | grep -v Hello | grep pipe > output && cat output

# cleanup
rm app
rm file
rm input
rm output
rm pipeTest
```

### ``hw3``
In [``hw3``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you're required to execute commands by searching the ``PATH`` environment variable, catch and handle when the user types ``Ctrl+c``, and implement ``cd``. The extra credit is given for handling when the user types ``CTRL+z``, as well as implementing ``fg`` and ``bg``. Here's how you would test [``hw3``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) using ``bat``:

```bash
bat rshell tests/signals
```

Here's part of what an example test file named ``signalsExampleTest`` would look like for this assignment:

```bash
# test cd
pwd
cd ..
pwd
cd rshell
pwd

# commands from different directories
# from /usr/bin:
md5sum --help >/dev/null
# from /usr/sbin:
ifconfig >/dev/null
# from /bin:
ls >/dev/null
# from /sbin:
mkfs --help >/dev/null

# test Ctrl+C
cat
^C

# test Ctrl+C again
ls -R /
^C

# a case for some extra credit:
cat
^Z
ps
fg
^C
```

An important thing to point out is that ``^C`` is not simply a caret next to captial C. [It is the ascii value representing the end of text.](http://academic.evergreen.edu/projects/biophysics/technotes/program/ascii_ctrl.htm) This gets interpreted by ``bash`` to send SIGINT to the currently running program, and your ``rshell`` must do the same. To put a ``^C`` in your test file in vim so you can test your signal handling, enter visual mode and hit ``Ctrl+v`` then ``Ctrl+c``. Similarly for ``^Z``, enter visual mode and hit ``Ctrl+v`` then ``Ctrl+z``.






