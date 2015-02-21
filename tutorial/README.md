# How to use ``bat``

## Sections
1. [``bat`` and hw0](#hw0)
2. [``bat`` and hw1](#hw1)
3. [``bat`` and hw2](#hw2)
4. [``bat`` and hw3](#hw3)
5. [Overview of Capabilities](#Summary)

### hw0
In [hw0](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you are required to create a basic shell that accepts commands and executes them. Additionally, you must implement ``&&``, ``||``, and ``;`` as connectors. Here's how you would test this using ``bat``:

```bash
bat rshell tests/exec
```

When using ``bat``, you specify the mode you would like to use, and then the file that holds the tests you'd like to run. ``tests/exec`` would look something like the following:

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

Another requirement for [hw0](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) is that you implement the ``exit`` command. Here's and example of what the test file for ``bat`` would look like:

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
      |-experiment
      |-execCommands
      |-execConnectors
      |-execExit_part1
      |-execExit_part2
      |-experiment
      |-filexecStuff
      `-hello
```

Then running ``bat rshell tests/exec`` will run your ``rshell`` with the ``execCommands``, ``execConnectors``, ``execExit_part1``, and ``execExit_part2`` files. ``bat`` will take the first part of the path you specify, and match it with everything that starts with that phrase. ``bat`` will fail on directories, however, so make sure it doesn't expand to include a directory.

### hw1


### hw2


### hw3


### Summary






