# How to use ``cs100-runtests``

## What is this?
This is a guide is designed to help familiarize you with the ``cs100-runtests`` utility.
It is broken up into four sections, one for each homework assignment.

### hw0
In [hw0](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you are required to create a basic shell that accepts commands and executes them.
Additionally, you must implement ``&&``, ``||``, and ``;`` as connectors.
Here's how you would run your tests for hw0: ``cs100-runtests bin/rshell tests/exec``.
[tests/execExampleTest](tests/execExampleTest1) shows what a test file would look like and [tests/exampleOutput](tests/exampleOutput) shows what the corresponding output would be.

``cs100-runtests`` accepts 3 parameters.
  1. The shell you'd like to run the tests in.
  For instance, it can either be ``bin/rhsell`` or ``bash``.
  In this case (hw0), you'll be passing ``bin/rshell" to ``cs100-runtests``.
  2. The tests you'd like to run.
  This parameter undergoes [filename expansion](https://www.gnu.org/software/bash/manual/html_node/Filename-Expansion.html).
  If the parameter is a directory, all of the contents of the directory are used as tests.
  If a filename returned from filename expansion is a directory, all of the contents of that directory are used as tests.
  3. The number of microseconds to wait between feeding commands to the shell chosen by mode.
  This parameter is optional, and defaults to ``100000`` (1/10th of a second).
  It is useful to set this if commands in a test file take longer than 1/10th of a second to finish.

An important thing to note about your ``rshell`` is that it must exit when there is no more input to be had.
If you're using ``cin``, ``cin.good()`` will return ``true`` if there isn't a problem with the ``cin`` stream.
When ``cs100-runtests`` is finished feeding lines of input to your ``rshell``, ``cin.good()`` will return ``false``.

Another requirement for [hw0](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) is that you implement the ``exit`` command.
[Here's an example test file for ``exit`` in ``rshell``.](tests/execExampleTest2)

When ``rshell`` exits, the rest of the tests in the file will not get passed.
Instead, try specifying multiple files to ``cs100-runtests`` using the rules for the second parameter.


### hw1
In [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules), you're required to implement the ``ls`` command.
Here's how you would test [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules): ``cs100-runtests bash tests/ls``.
[This is an example test file for hw1.](tests/lsExampleTest)

The main difference between testing [``hw1``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) and [``hw0``](https://github.com/mikeizbicki/ucr-cs100/#course-schedules) is the mode you're testing in.
If you're testing ``rshell``, use the ``rshell`` testing mode.
If you'd like to run your tests through ``bash``, use ``bash`` mode.
For this assignment, you don't need to use ``rshell`` to test.
You may use ``rshell`` to test it if you'd like by running ``cs100-runtests rshell tests/ls`` instead, but it's not required for this assignment.

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

Signals can be sent in bash mode, but bash does not relay them to the currently running program.


