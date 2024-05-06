# ANT3814: Seminar d'anthropologie -  Computational Methods in Molecular Anthropology

## Lecture 1: The Unix command line

Todays class material is modified and translated into French from: 

Programming for Biology [programmingforbiology.org](http://programmingforbiology.org) and was originally written by Simon Prochnik and Sofia Robb. Much of that class material is freely available online. It is also offered as a great [2-week intensive course]([https://meetings.cshl.edu/courses.aspx?course=c-info&year=24]) at Cold Spring Harbor Laboratory to learn Python for bioinformatics.  

# Big Picture

## Why?

Why is it important for **biological anthropologists** to learn to program?

You might already know the answer to this question since you are here.

We firmly believe that knowing how to program is just as essential as knowing how to run a gel or set up a PCR reaction. The data we now get from a single experiment can be overwhelming. This data often needs to be reformatted, filtered, and analyzed in unique ways. Programming allows you to perform these tasks in an **efficient** and **reproducible** way.

What are our tips for having a successful programming course?

1. Practice, practice, practice. Please spend as much time as possible actually coding.

2. Write only a line or two of code, then test it. If you write too many lines, it becomes more difficult to debug if there is an error.

3. Errors are not failures. Every error you get is a learning opportunity. Every single error you debug is a major success. Fixing errors is how you will cement what you have learned.

4. Don't spend too much time trying to figure out a problem. While it's a great learning experience to try to solve an issue on your own, it's not fun getting frustrated or spending a lot of time stuck. I am here to help you, so please ask me whenever you need help.

5. Lectures are important, but the practice is more important.

6. Review sessions are important, but practice is more important.

7. Our key goal is to slowly, but surely, teach you how to solve problems on your own.

---

# Unix (linux, mac OS)



### Unix Overview

#### What is the Command Line?

Underlying the pretty Mac OSX Graphical User Interface (GUI) is the operating system (OS). It's based on BSD which is a version of Unix. Linux is pretty similar and also a very common OS in bioinformatics and you'll run into dialects by Red Hat, Ubuntu and others.

The command line gives you access to the internals of the OS, and is also a convenient way to write custom software and scripts.

Most bioinformatics tools are written to run on the command line and have no Graphical User Interface. In many cases, a command line tool is more versatile than a graphical tool, because you can easily combine command line tools into automated scripts that accomplish custom tasks sequentially without human intervention.

In this course, we will be using Linux and R to write scripts and run them from the command line.

The Unix OS is complicated and there are always more things to learn about it. We'll just cover enough to get you going

### The Basics

#### Logging into Your Computer

Your computer in this classroom is a windows PC. However, windows is not a Unix operating system and lacks the same systems for file structure operational commands.  If your personal computer is a mac or already running a linux OS, that's great! Otherwise, we will need to connect you to a Linux OS we can do that in two ways. 

#### Linux Virtual Machine 

In order to use Linux on Windows, we need to load a Linux OS as a "virtual machine" (VM). We can install Ubuntu, a version of linux, with a free program called VirtualBox. 

The Ubuntu OS is very similar to windows and mac OS. To log into it, provide your user name and password. Your username is 'ANT3814' and the password is 'darwin1859'. For our class, we'll need to load an application called "terminal" which allows us to access the command line 

#### Bringing up the command line 


To bring up the command line, use the Finder to navigate to _Applications->Utilities_ and double-click on the _Terminal_ application. This will bring up a window like the following:
![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/UbuntuTerminal.png?raw=true)

You can open many Terminal windows at once. This is often helpful. A common way to work is to open your code editor in one window, run the code from another and view data and files in another.


You will be using the Terminal application a lot, so I suggest that you drag its icon into the shortcuts bar at the bottom of your screen.


#### OK. I've Logged in.  What Now?


The terminal window is running **shell** called "bash".  The shell is a loop that:
1. Prints a prompt
2. Reads a line of input from the keyboard
3. Parses the line into one or more commands
4. Executes the commands (which usually print some output to the terminal)
5. Go back step 1.

There are many different shells with bizarre names like **bash**, **sh**, **csh**, **tcsh**, **ksh**, and **zsh**.  The "sh" part means shell.  Each shell has slightly different syntax and features. **bash**  is standard in Linux systems, but Mac OS recently switched from bash to **zsh**, but they are both very similar.

#### Command Line Prompt

Most of bioinformatics is done by running command line software in a shell, so you should take some time to learn to use the shell effectively.


This is a command line prompt:

```
student@ant3814:~$
```

This is another:

```
$ 1:12PM>
```
This is another:
```
[orkin@narval3 projects]$
```

What you see depends on how the system administrator has customized your login.  You can customize it yourself (but we won't go into that here)

The prompt tells you the shell is ready for you to type a command.  Most commands run almost instantly, but if you run a long command, the prompt will not reappear until it is finished and the system is ready to accept your next request.

#### Issuing Commands

You type in a command and press the &lt;Enter&gt; key to execute it.  If the command has output, it will appear on the screen.  Example:

```
student@ant3814:~$ ls
COURS 		Desktop		Downloads	Pictures	readme.txt	snap	transitions.txt
data.txt	Documents	Music		Public		results.txt	Templates	Videos
student@ant3814:~$
```

The command here is `ls`, which produces a listing of files and directories in the current directory (more on that later).  Below its output, the command prompt appears again.

Some programs will take a long time to run. After you issue their command names, you won't recover the shell prompt until they're done. You can keep working in the meantime, either by launching a new shell (from Terminal's File menu), or running the command in the background by adding an ampersand at the end of the command like so

```
student@ant3814:~$ long_running_application &
student@ant3814:~$
```
> The command will now run in the background until it is finished. If it has any output, the output will be printed to the terminal window. You may wish to capture the output in a file (called redirection). We'll describe this later.

#### Command line Editing

Most shells offer command line editing.  Up until the moment you press \<Enter\>, you can go back over the command line and edit it using the keyboard.  Here are the most useful keystrokes:

- _Backspace_: Delete the previous character and back up one.
- _Left arrow_, right arrow: Move the text insertion point (cursor) one character to the left or right.
- _control-a (^a)_: Move the cursor to the beginning of the line. (Mnemonic: A is first letter of alphabet)
- _control-e (^e)_: Move the cursor to the end of the line. (Mnemonic: E for the End) (^z was already used to interrupt a command).
- _control-d (^d)_: Delete the character currently under the cursor. D=Delete.
- _control-k (^k)_: Delete the entire line from the cursor to the end. k=kill.  The line isn't actually deleted, but put into a temporary holding place called the "kill buffer". This is like cutting text
- _control-y (^y)_: Paste the contents of the kill buffer onto the command line starting at the cursor.  y=yank. This is like paste.
- _Up arrow, down arrow_: Move up and down in the command history.  This lets you rerun previous commands, possibly modifying them before you do.

There are also some useful shell commands you can issue:  

- `history` Show all the commands that you have issued recently, nicely numbered.
- `!<number>` Reissue an old command, based on its number (which you can get from `history`).
- `!!` Reissue the last command.
- `!<partial command string>`: Reissue the previous command that began with the indicated letters.  For example, `!l` (the letter el, not a number 1) would reissue the`ls` command from the earlier example.
- *control-r (^r)*: enter string and search through history for commands that match it. This is really useful.

**bash** offers automatic command completion and spelling correction.  If you type part of a command and then the <tab> key, it will prompt you with all the possible completions of the command.  For example:

```
student@ant3814:~$  le<tab><
less	lessecho	lessfile	lesskey		lesspipe	let		lexgrog
student@ant3814:~$ le
```
> If you hit tab after typing a command, but before pressing \<Enter\>, **bash** will prompt you with a list of file names. This is because many commands operate on files.

#### Wildcards

You can use wildcards when referring to files.  `*` stands for zero or more characters.  `?` stands for any single character.  For example, to list all files with the extension ".txt", run `ls` with the wildcard pattern "*.txt"

```
student@ant3814:~$ ls *.txt
data.txt	readme.txt	results.txt		transitions.txt
student@ant3814:~$ 
```

There are several more advanced types of wildcard patterns that you can read about in the **bash** manual page.  For example, if you want to match files that begin with the characters "f" or "g" and end with ".txt", you can put both characters inside square brackets `[fg]` as part of the wildcard pattern. Here's an example

```
student@ant3814:~$ ls [rd]*.txt
data.txt	readme.txt	results.txt
student@ant3814:~$
```
You can also search for a range of characters e.g. `[a-e]` or `[1-5]`.

### Directories and how they are organized

A computer comes with a place to store scripts, data, images, OS and other files. It used to be floppy disks, then hard drives and these days it's often a solid state drive (SSD). Let's talk about how the storage is organized to help you find what you are working on. Directories or folders are created inside other directories. One directory is special. This is the **root directory** because it is not inside any other directories (it's written `/`). Files that go together are created inside a directory to keep them organized. This creates a structure that can be drawn like a branching tree. We find it clearer to turn it upside down to look like branching roots. 

**Example diagram of a linux directory structure starting from the root directory**

![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/directory_structure.png?raw=true)


#### Home Sweet Home (your home directory `~`)

When you first log in, you'll be in your personal directory (or folder), called the **home directory**. This directory has the same name as your login name, and on linux, it's typically in `/home` (on mac OS is located inside the directory `/Users`). If your username is `jdesjardins`, your home directory would be `/Users/jdesjardins`. This is a filepath or a path. Unix if full of abbreviations to save on typing common things. The shell allows you to abbreviate it as `~username` (where "username" is your user name or someone elses), or simply as `~`.  The `~` character (called "tilde") is at the upper left corner of your keyboard.

In your home directory, you have permission to save, delete, open and move files and other directories. In general, you can read but not write or modify files elsewhere in the system.

To see what is in your home directory, issue the command `ls` for list directory contents

![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/ls-home.png?raw=true)

You can modify the way a command works with switches. These are single letters typed after a dash `-`. The case is important. So `ls -aF` lists all (`a`) files including hidden filenames that start with a `.` with fancy formatting turned on (`F`) such that a`/` is added to the end of directory names.

![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/ls-aF.png?raw=true)

> Don't go deleting the hidden files. Many of them are essential configuration files for commands and other programs.  For example, the `.bashrc` file contains configuration information for the **bash** shell. You can edit it (a bit later, when you know what you're doing) in order to change things like the command prompt and command search path.

#### Changing to a New Directory


You can move around from directory to directory using the `cd` command (for change directory).  Give the name of the directory you want to move to, or give no name to move back to your home directory.  Use the `pwd` command (print working directory) to see where you are (or, if configured, this information will appear in the prompt):

```
student@ant3814:~$ cd Documents 
student@ant3814:~/Documents$  pwd
/home/student/Documents
student@ant3814:~/Documents$ cd
student@ant3814:~$ cd /
student@ant3814: / % ls -F

```
![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/ls-root.png?raw=true)


Each directory contains two special hidden directories named `.` and `..`. The first, `.` refers always to the current directory. `..` refers to the parent directory.  This lets you move upward in the directory hierarchy like this:

```
student@ant3814:~/Documents$ cd ..
```
and to do cool things like this:

```
student@ant3814:~/Documents$ cd ../../student/Documents
```

> The latter command moves upward two levels, and then into a directory named `Documents` inside a directory called `student`.


If you get lost, the `pwd` command prints out the full path to the current directory:

```
student@ant3814:~/Documents$ pwd
/home/student/Documents
```

#### Absolute and relative paths

We can type a path in two ways, an absolute path always starts with a `/` character and reads from the root directory. A relative path starts with another character and reads from the directory you are currently in. Here are two ways to get to a directory called `Music` in the home directory of the user `student`. From `Documents` we can go up a directory and down into `Music` (relative path) or go from `/` to `home` to `ant3814` to `Music` (absolute path). 

```
student@ant3814:~/Documents$ cd ../Music   
student@ant3814:~/Music$ cd
student@ant3814:~$ cd /home/student/Music
student@ant3814:~/Music$ 
```

>  Which of these paths would work for a different user as well as for `ant3814`?

### Essential Unix Commands


With the exception of a few commands that are built directly into the shell (e.g. `history`, `for`, `if`), all Unix commands are actually executable programs.  When you type the name of a command, the shell will search through all the directories listed in the PATH environment variable for an executable of the same name.  If found, the shell will execute the command. Otherwise, it will give a "command not found" error.


Most commands live in `/bin`, `/sbin`, `/usr/bin`, `/usr/sbin/` or `/usr/local/bin`.

#### Getting Information About Commands


The `man` command will give a brief synopsis of a command. Let's get information about the command `wc`

```
student@ant3814:~$ man wc
Formatting page, please wait...
WC(1)                                                       WC(1)

NAME
       wc - print the number of bytes, words, and lines in files

SYNOPSIS
       wc [-clw] [--bytes] [--chars] [--lines] [--words] [--help]
       [--version] [file...]

DESCRIPTION
       This manual page documents the  GNU  version  of  wc.   wc
       counts  the  number  of bytes, whitespace-separated words,
...
```

#### Finding Out What Commands are on Your Computer

The `apropos` command will search for commands matching a keyword or phrase. Here's an example that looks for commands related to 'column'

```
student@ant3814:~$ apropos column
showtable (1)        - Show data in nicely formatted columns
colrm (1)            - remove columns from a file
column (1)           - columnate lists
fix132x43 (1)        - fix problems with certain (132 column) graphics
modes
```

#### Arguments and Command Line Switches 


Many commands take arguments.  Arguments are often the names of one or more files to operate on.  Most commands also take command line "switches" or "options", which fine-tune what the command does.  Some commands recognize "short switches" that consist of a minus sign `-` followed by one or more single characters, while others recognize "long switches" consisting of two minus signs `--` followed by a whole word. 


The `wc` (word count) program is an example of a command that recognizes both long and short options.  You can pass it the single`-c`,  `-w` and/or `-l` options (or combinations of them) to count the characters, words, and lines in a text file, respectively.  Or you can use the longer but more readable `--chars`,  `--words` or `--lines` options.  Both these examples count the number of characters and lines in the text file `/var/log/README`:

```
student@ant3814:~$ wc -c -l /var/log/README
     25     1041 /var/log/README
student@ant3814:~$ wc --chars --lines /var/log/messages
     25     1041 /var/log/README
```

You can cluster one-character switches by concatenating them together, as shown in this example:

```
student@ant3814:~$ wc -cl /var/log/README
     25     1041 /var/log/README
```

Many commands will give a brief usage summary when you call them with the `-h` or `--help` switch.

#### Spaces, tabs and newline Characters

The shell uses spaces to separate arguments.  If you want to embed a space (see below for other whitespace or non-printing characters like a tab or newline etc) in an argument, put single quotes around it.  For example:

```
mail -s 'An important message' 'Bob Ghost <bob@ghost.org>'
```
This will send an e-mail to the fictitious person Bob Ghost.  The `-s` switch takes an argument, which is the subject line for the e-mail.  Because the desired subject contains spaces, it has to have quotes around it. Likewise, my name and e-mail address, which contain embedded spaces, must also be quoted in this way.


Certain special non-printing characters have _escape codes_ associated with them:


| Escape Code | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| \\n         | new line character                                           |
| \\t         | tab character                                                |
| \\r         | carriage return character                                    |
| \\a         | bell character (ding! ding!)                                 |
| \\NNN       | the character whose octal ASCII code is **NNN** e.g. `printf '\101'` prints 'A' <br>[ASCII code tables](https://www.rapidtables.com/code/text/ascii-table.html)|

### Useful Commands

Here are some commands that are used extremely frequently.  Use `man` to learn more about them.  Some of these commands may be useful for solving the problem set ;-)

#### Manipulating  Directories

| Command | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `ls`    | Directory listing.  Most frequently used as `ls -F` (decorated listing), `ls -l` (long listing), `ls -a` (list all files). |
| `mv`    | Rename or move a file or directory.                          |
| `cp`    | Copy a file. `cp -r` (recursively) to copy directories       |
| `rm`    | Remove (delete) a file. `rm -rf olddata.tsv`                 |
| `mkdir` | Make a directory                                             |
| `ln`    | Create a symbolic or hard link. `ln -s` makes a symbolic (sym) link |
| `chmod` | Change the permissions of a file or directory.               |


#### Reading files

| Command           | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| `cat`             | Concatenate program.  Can be used to concatenate multiple files together into a single file, or, much more frequently, to view the contents of a file or files in the terminal. |
| `more`            | Scroll through a file page by page.  Very useful when viewing large files.  Works even with files that are too big to be opened by a text editor. |
| `less`            | A version of `more` with more features.                      |
| `head`            | View the first few lines of a file.  You can control how many lines to view `head -3` prints the first three lines. |
| `tail`            | View the end of a file.  You can control how many lines to view.  You can also use `tail -f` to view a file that you are writing to. |

#### Analyzing, processing files
| Command | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `wc`              | Count words, lines and/or characters in one or more files.   |
| `sort`            | Sort the lines in a file alphabetically or numerically (-g or -n) in reverse order (-r). |
| `uniq`            | Remove duplicated lines in a file.                           |
| `cut`             | Remove columns from each line of a file or files.            |
| `grep`            | Filter a file for lines matching a specified pattern.  Can also be reversed to print out lines that don't match the specified pattern. |
| `gzip` (`gunzip`) | Compress (uncompress) a file.                                |
| `tar`             | Archive or unarchive an entire directory into a single file. |

#### Editing files
| Command | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `tr`              | Substitute one character for another.  Also useful for deleting characters. |
| `emacs`           | Run the Emacs text editor (good for experts).                |
| `vi`              | Run the vi text editor (good for experts).         |
| `echo`            | print text to the screen. E.g. `echo 'Hello World!'` |


#### Connecting to other computers

| Command                | Description                                                  |
| ---------------------- | ------------------------------------------------------------ |
| `ssh`                  | A secure (encrypted) way to log into machines.               |
| `scp`                  | A secure way to copy (cp) files to and from remote machines. |
#### Standard I/O and Redirection


Unix commands print output to the terminal (screen) for you to see, and accept input from the keyboard (that is, from _you_!)


Every Unix program starts out with three connections to the outside world.  These connections are called **streams**, because they act like a stream of information (metaphorically speaking):


| Stream Name     | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| standard input  | This is initially attached to the keyboard.  When the program reads from standard input, it reads whatever text you type in. |
| standard output | This stream is initially attached to the terminal. Anything the program prints to this stream appears in your terminal window. |
| standard error  | This stream is also initially attached to the terminal. It is a separate stream intended for printing error messages. |

The word "initially" might lead you to think that standard input, output, and error can somehow be detached from their starting places and reattached somewhere else.  And you'd be right.  You can attach one or more of these three streams to a file, a device, or even to another program.  This sounds esoteric, but it is actually very useful.

#### A Simple Example


The `wc` program counts lines, characters, and words in data sent to its standard input.  You can use it interactively like this:

```
student@ant3814:~$ wc
Alouette, gentille alouette,  
Alouette, je te plumerai

Je te plumerai la tete
Je te plumerai la tete
Alouette, alouette
A a a ah
^d                    # ** NOTE - this is ctrl-d which you type, but no output shows up 
                      # in terminal window
      6      23     126
```
In this example, I ran the `wc` program.  It waited for me to type in a little poem.  When I was done, I typed the END-OF-FILE character, control-d (^d for short).  `wc` then printed out three numbers indicating the number of lines (6), words (23), and characters (126) in the input.

More often, you'll want to count the number of lines in a big file and save the results in another file. We'll see this in two steps. First, we send the output of `wc` to stdout. In the second command, we _redirect_ stdout from `wc` to a file with the `>` symbol.

```
student@ant3814:~/COURS/FICHIERS$ wc big_file.fasta
      57    81    2423
student@ant3814:~/COURS/FICHIERS$ wc big_file.fasta > count.txt
```


Now if you `cat` the file _count.txt_, you'll see that the data has been recorded.

```
student@ant3814:~$ cat count.txt
      57    81     2423
```

#### Redirection Meta-Characters

Here's the complete list of redirection commands for **bash**:

| Redirect command    | Description                              |
| ------------------- | ---------------------------------------- |
| `< myfile.txt`      | Redirect the contents of the file to standard input |
| `> myfile.txt`      | Redirect standard output to file         |
| `>> logfile.txt`    | Append standard output to the end of the file |
| `1> myfile.txt`    | Redirect just standard output to file (same as above) |
| `2> myfile.txt`    | Redirect just standard error to file     |
| `&> myfile.txt` | Redirect both stdout and stderr to file  |


These can be combined.  For example, this command redirects standard input from the file named `/etc/passwd`, writes its results into the file `search.out`, and writes its error messages (if any) into a file named `search.err`.  What does it do?  It searches the password file for a user named "root" and returns all lines that refer to that user.

```
student@ant3814:~$ grep root /etc/passwd > search.out 2> search.err
```

#### Filters, Filenames, and Standard Input

Many Unix commands act as filters, taking data from a file or standard input, transforming the data, and writing the results to standard output.  Most filters are designed so that if they are called with one or more filenames on the command line, they will use those files as input.  Otherwise they will act on standard input.  For example, these two commands are equivalent:

```
student@ant3814:~/COURS/FICHIERS$ grep 'GATTGC' big_file.fasta
student@ant3814:~/COURS/FICHIERS$ grep 'GATTGC' < big_file.fasta
```
Both commands use the `grep` command to search for the string "GATTGC" in the file `big_file.fasta`.  The first command is explicitly given the name of the file on the command line; the second one searches standard input, which is redirected from the file to stdin of `grep`.


Sometimes you want a filter to act on a series of files, one of which happens to be standard input.  Many commands let you use `-` on the command line as an alias for standard input.  Example:

```
student@ant3814:~/COURS/FICHIERS$ grep 'gatttgc' big_file.fasta bigger_file.fasta -
```
This example searches for "GATTGC" in three places.  First it looks in file `big_file.fasta`, then in `bigger_file.fasta`, and lastly in standard input (which, since it isn't redirected, will come from the keyboard).

#### Standard I/O and Pipes


The coolest thing about the Unix shell is its ability to chain commands together into mini pipelines.  Here's an example:

```
student@ant3814:~/COURS/FICHIERS$ grep 'GATTGC' big_file.fasta | wc -l
4
```
There are two commands here. `grep` searches a file or standard input for lines containing a particular string.  Lines which contain the string are printed to standard output.  `wc -l` is the familiar word count program, which counts words, lines, and characters in a file or standard input.  The `-l` command line option instructs `wc` to print out just the line count.  The `|` character, which is known as a "pipe", connects the two commands together so that the standard output of `grep` becomes the standard input of `wc`. Think of pipes connecting streams of flowing data. 


What does this pipe do?  It prints out the number of lines in which the string "GATTGC" appears in the file `big_file.fasta`.

#### More Pipe Idioms

Pipes are very powerful. Here are some common command line idioms.

**Count the Number of Times a Pattern does NOT Appear in a File**

The example at the top of this section showed you how to count the number of lines in which a particular string pattern appears in a file.  What if you want to count the number of lines in which a pattern does **not** appear?

Simple.  Reverse the test with the `-v` switch:

```
student@ant3814:~/COURS/FICHIERS$ grep -v "GATTGC" big_file.fasta | wc -l
2921
```

**Extract the Unique Lines in a File**


If you have a long list of names in a text file, and you want to weed out the duplicates:

```
student@ant3814:~/COURS/FICHIERS$ sort long_file.txt | uniq > unique.out
```
This works by sorting all the lines alphabetically and piping the result to the `uniq` program, which removes duplicate lines that occur one after another.  That's why you need to sort first. The output is placed in a file named `unique.out`.

**Concatenate Several Lists and Remove Duplicates**


If you have several lists that might contain repeated entries among them, you can combine them into a single unique list by concatenating them together, then sorting and extracting the unique lines them as before:

```
student@ant3814:~/COURS/FICHIERS$ cat file1 file2 file3 file4 | sort | uniq
```

**Count Unique Lines in a File**


If you just want to know how many unique lines there are in the file, add a `wc` to the end of the pipe:

```
student@ant3814:~/COURS/FICHIERS$ sort long_file.txt | uniq | wc -l
```
You can also count how many copies of each unique line exist in one or multuple files
```
student@ant3814:~/COURS/FICHIERS$ sort file1.txt file2.txt file3.txt file4.txt |uniq -c
```

**Page Through a Really Long Directory Listing**


Pipe the output of `ls` to the `less` program, which shows a page at a time.  
```
student@ant3814:~/COURS/FICHIERS$ cat sample.vcf | less
```
if you run less on a file that has very long lines, you can improve the visualization with the -S switch

``` 
student@ant3814:~/COURS/FICHIERS$ less -S sample.vcf
```

**Monitor a Growing File for a Pattern**


Pipe the output of `tail -f` (which monitors a growing file and prints out the new lines) to `grep`.  For example, this will monitor the `/var/log/syslog`file for the appearance of e-mails addressed to 'student':

```
student@ant3814:~$ tail -f /var/log/syslog | grep student
```

### Permissions

Often several different users work on the same computer. To help them work without disrupting each other, a set of permissions is attached to files and directories. These permissions allow or prevent reading, writing or executing a file. There are permissions for the user, group and other.  You can view permissions with an `ls -l` command.

```
student@ant3814:~$ ls -l
total 16
drwx------+  3 dbrown  staff   96 Oct 15 14:09 Desktop
drwx------+  3 dbrown  staff   96 Oct 15 14:09 Documents
...
-rw-r--r--   1 dbrown  staff    9 Oct 15 14:12 expt1.countdata.tsv
-rw-r--r--   1 dbrown  staff   20 Oct 15 14:11 notes.txt
-rw-r--r--   1 dbrown  staff   23 Oct 16 13:37 print.py
```

The series of characters at the beginning of the line describe the permissions. The first character is 

```
d (directory) l for link - for file
```

Then there are three triples of characters (- means not allowed, a letter means you have read, write, execute permission). x for a directory means you can access the directory


rwx
```

pour l'utilisateur, le groupe, l'autre, comme suit

```
   Usr   Grp	Autr
d rwx	rwx	rwx
```

Users can belong to groups (who collaborate) and other is everyone else.

The `chmod` command (change mode) alters permissions. You add permissions with `+` and take them away with `-`

You can alter permissions for user `u`, group `g`, other `o` or all `a`

To make the print.py file executable (i.e. runnable like a programme) you write

```
student@ant3814:~$ ls -l print.py 
-rw-r--r--  1 student  staff  23 Oct 16 13:37 print.py
student@ant3814:~$ chmod a+x print.py 
student@ant3814:~$ ls -l print.py 
-rwxr-xr-x  1 student  staff  23 Oct 16 13:37 print.py
student@ant3814:~$
```

To stop others from reading or executing the python script, you write

```
student@ant3814:~$ chmod o-rx print.py 
student@ant3814:~$ ls -l print.py 
-rwxr-x---  1 dbrown  staff  23 Oct 16 13:37 print.py
```

To convert a script into an exectuable programme, you'll need to make it executable with chmod and then add the current directory to your PATH (we'll see how to do this later) for you, you can type the command in your terminal window.

```
export PATH=".:${PATH}"       # add '.', the current dir to the list of paths
                              # the OS looks for programmes in
rehash    # this rebuilds set of paths for the shell
```


<div style="page-break-after: always;"></div>  


### More Unix

Here are a few more advanced Unix commands that are very useful, and when you have time you should investigate further. We list the page numbers for the Linux Phrasebook Second Edition by Scott Granneman or links to online tutorials.

 - `awk` (Linux Phrasebook p.194-198)([online tutorial](https://www.tutorialspoint.com/awk/index.htm))
 - `sed` (Linux Phrasebook p.188-194)([online tutorial](https://www.tutorialspoint.com/sed/index.htm))
 - `perl` one-liners ([online tutoral](https://catonmat.net/introduction-to-perl-one-liners))
 - `for` loops ([online tutorial](https://www.tutorialspoint.com/unix/for-loop.htm))

---


### [Link to Unix 1 Problem Set](problemsets/Unix_01_problemset.md)


<div style="page-break-after: always;"></div>  
