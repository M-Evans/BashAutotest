# How to use ``cs100-runtests``

## What is this?
This is a guide is designed to help familiarize you with the ``cs100-runtests`` utility.
It is broken up into four sections, one for each homework assignment.

### hw0
In [hw0](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you are required to create a basic shell that accepts commands and executes them.
Additionally, you must implement ``&&``, ``||``, and ``;`` as connectors.
Here's how you would run your tests for hw0: ``cs100-runtests bin/rshell tests/exec``.
[tests/execExampleTest1](tests/execExampleTest1) shows what a test file would look like and [tests/execExampleTest1_Output](tests/execExampleTest1_Output) shows what the corresponding output would be.

``cs100-runtests`` accepts 3 parameters.
  1. The shell you'd like to run the tests in.
  For instance, it can either be ``bin/rhsell`` or ``bash``.
  In this case (hw0), you'll be passing ``bin/rshell" to ``cs100-runtests``.
  2. The tests you'd like to run.
  This parameter undergoes [filename expansion](https://www.gnu.org/software/bash/manual/html_node/Filename-Expansion.html).
  If the parameter is a directory, all of the contents of the directory are used as tests.
  If a filename returned from filename expansion is a directory, all of the contents of that directory are used as tests.
  3. The number of microseconds to wait between feeding commands to the chosen shell.
  This parameter is optional, and defaults to ``100000`` (1/10th of a second).
  It is useful to set this to a larger value if commands in a test file take longer than 1/10th of a second to finish.

An important thing to note about your ``rshell`` is that it must exit when there is no more input to be had.
If you're using ``cin``, ``cin.good()`` will return ``true`` if there isn't a problem with the ``cin`` stream.
When ``cs100-runtests`` is finished feeding lines of input to your ``rshell``, ``cin.good()`` will return ``false``.

Another requirement for hw0 is that you implement the ``exit`` command.
[tests/execExampleTest2](tests/execExampleTest2) is one example of a test file for ``exit`` in ``rshell``.
There is a problem, however.
When ``rshell`` is finished executing, none of the remaining tests will be passed.
To test exit multiple times, you need to specify multiple test files.
[tests/execExampleTest3](tests/execExampleTest3) contains an example of a distinct test for ``exit`` in ``rshell``.


### hw1
In [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you're required to implement the ``ls`` command.
Here's how you would test [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules): ``cs100-runtests bash tests/ls``.
The file [tests/lsExampleTest](tests/lsExampleTest) contains an incomplete list of test cases for hw1.

The main difference between testing [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) and [``hw0``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) is the shell you're running your tests through.
If you'd like to use ``rshell``, pass the path to your ``rshell`` executable.
If you'd like to run your tests through ``bash``, pass in ``bash`` instead.
For this assignment, you are not required to run your tests through ``rshell``.

### hw2
In [``hw2``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you're required to implement several different piping and redirection features that use ``<``, ``>``, ``>>``, and ``|`` as part of their syntax.
Here's how you would test [``hw2``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules): ``cs100-runtests rshell tests/piping``.
This file ([tests/pipingExampleTest](tests/pipingExampleTest)

### hw3
In [``hw3``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you're required to execute commands by searching the ``PATH`` environment variable, catch and handle when the user types ``Ctrl+c``, and implement ``cd``.
The extra credit is given for handling when the user types ``CTRL+z``, as well as implementing ``fg`` and ``bg``.
Here's how you would test [``hw3``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules): ``cs100-runtests rshell tests/signals``.
[This is an example test for hw3.](tests/signalsExampleTest)

In the example test file, I put ``^C`` in plaintext so you could see it.
For your actual tests, do not do this.

Instead, you must put the [ASCII end of text character.](http://en.wikipedia.org/wiki/End-of-text_character) [Ctrl+C, used for interrupting a running program, overlaps with this character.](http://en.wikipedia.org/wiki/Control-C)
To place an ASCII end of text character in vim, enter insert mode and hit ``Ctrl+v`` then ``Ctrl+c``.

For the extra credit, you will need to handle ``^Z``, which represents sending ``SIGTSTP`` to your shell.
It overlaps with the [ASCII substitute character.](http://en.wikipedia.org/wiki/Substitute_character)
To have ``cs100-runtests`` send ``SIGTSTP`` to your ``rshell``, you must put the ASCII substitute character in the test file.

To place an ASCII substitute character in vim, enter insert mode and hit ``Ctrl+v`` then ``Ctrl+z``.

The control characters must be on a line by themselves in order for ``cs100-runtests`` to send the corresponding signal to the running program.

Signals can be sent to ``bash``, but ``bash`` does not relay them to the currently running program.


