# Bash loops

Until now, all the code that we have used has operated line by line. You type something into the terminal and it operates on a single file or performs a single operation. One of the most powerful things about a programming language like bash is that it allows you to write commands that operate on multiple files one after another without additional input.  This type of command is called a **loop**. There are a few different types of loops that can be written in bash, but we are going to focus on two of them, the **for** loop and the **while** loop. 

## for loops

Let's say that we had a list of names: Charlotte, Joe, Jimmy, Mikerlange, Sarah and we would like to print them to the screen with the word "Bonjour" in front of each name each on a separate line. We could do that by typing out the following commands one at a time as follows:

```
student@ant3814:~$ echo "Bonjour Charlotte"
Bonjour Charlotte
student@ant3814:~$ echo "Bonjour Joe"
Bonjour Joe
student@ant3814:~$ echo "Bonjour Jimmy"
Bonjour Jimmy
student@ant3814:~$ echo "Bonjour Mikerlange"
Bonjour Mikerlange
student@ant3814:~$ echo "Bonjour Sarah"
Bonjour Sarah
```
That's pretty slow and inefficient though. We could improve things a but by adding semicolons and new line characters between each line. A semicolon tells bash that the command has ended. This allows you to write multiple commands on a single line to be run by bash one after another (serial commands). For example:

```
student@ant3814:~$ echo "Bonjour Charlotte"; echo "Bonjour Joe"; echo "Bonjour Jimmy"; echo "Bonjour Mikerlange"; echo "Bonjour Sarah";
Bonjour Charlotte
Bonjour Joe
Bonjour Jimmy
Bonjour Mikerlange
Bonjour Sarah
```
This is better, but we are still writing five separate commands with a lot of repeated text. Wouldn't it be great if we could simplify this to tell bash to print "Bonjour " in front of a list of names? This is where we can use a for loop, which has the following structure:

**for a newVariable in a list; do a command to the $newVariable; done** 

|Action | Code|
|---|--|
|type of loop|for |
|variable | prenom|
|location|in|
|list|Charlotte Joe Jimmy Mikerlange Sarah|
|start| do;|
|command| echo $prenom;|
|stop| done;|

```
student@ant3814:~$ for prenom in Charlotte Joe Jimmy Mikerlange Sarah; do echo "Bonjour $prenom"; done 
Bonjour Charlotte
Bonjour Joe
Bonjour Jimmy
Bonjour Mikerlange
Bonjour Sarah
```
Note here the importance of the semicolons, which act to separate the three parts of the loop

```for name in Charlotte Joe Jimmy Mikerlange Sarah; ```
```do "echo $name";```
```done```

Let's do something a little more complex. Suppose we have a folder with 50 files in it that we need to rename. run the shell script makeFiles.sh to make a 50 empty files in a directory called "FILES", then list the contents of the folder

```
student@ant3814:~$ bash makeFiles.sh
student@ant3814:~$ ls FILES/
file1.txt  file14.txt file19.txt file23.txt file28.txt file32.txt file37.txt file41.txt file46.txt file50.txt
file10.txt file15.txt file2.txt  file24.txt file29.txt file33.txt file38.txt file42.txt file47.txt file6.txt
file11.txt file16.txt file20.txt file25.txt file3.txt  file34.txt file39.txt file43.txt file48.txt file7.txt
file12.txt file17.txt file21.txt file26.txt file30.txt file35.txt file4.txt  file44.txt file49.txt file8.txt
file13.txt file18.txt file22.txt file27.txt file31.txt file36.txt file40.txt file45.txt file5.txt  file9.txt
``` 

Notice that files  1-9 are not listed first. That's because bash like many operating systems orders characters according to ascii order: 

```blank ! " # $ % & ' ( ) * + , - . /0 1 2 3 4 5 6 7 8 9 : ; < = > ? @ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z[ \] ˆ_ a b c d e f g h i j k l m n o p q r s t u v w x y z { } ~```

In this ordering system, the point character comes before digits, so file1.txt is ordered before file10.txt and file4.txt doesn't come until after file39.txt.

Let's make the file names easier to order by adding a zero to the names of the first 9 files. We can do that with a for loop that lists the numbers 1 though 9:

```
for number in 1 2 3 4 5 6 7 8 9; do mv file${number}.txt file0${number}.txt ; done
```

Be careful, though! Making a loop that renames your files is dangerous, because you can accidentally mixup all your files or erase them if you have an error in your code. **Always  test your loop by adding echo** to the command first to see that the code is right.

 ```
student@ant3814:~/FILES$ for number in 1 2 3 4 5 6 7 8 9; do echo "mv file${number}.txt file0${number}.txt" ; done
mv file1.txt file01.txt
mv file2.txt file02.txt
mv file3.txt file03.txt
mv file4.txt file04.txt
mv file5.txt file05.txt
mv file6.txt file06.txt
mv file7.txt file07.txt
mv file8.txt file08.txt
mv file9.txt file09.txt
```

Here we are using the loop to print the commands to the screen first. Once things look good, you can remove the echo command and run the code to rename the files.

```
student@ant3814:~/FILES$ ls 
file01.txt file06.txt file11.txt file16.txt file21.txt file26.txt file31.txt file36.txt file41.txt file46.txt
file02.txt file07.txt file12.txt file17.txt file22.txt file27.txt file32.txt file37.txt file42.txt file47.txt
file03.txt file08.txt file13.txt file18.txt file23.txt file28.txt file33.txt file38.txt file43.txt file48.txt
file04.txt file09.txt file14.txt file19.txt file24.txt file29.txt file34.txt file39.txt file44.txt file49.txt
file05.txt file10.txt file15.txt file20.txt file25.txt file30.txt file35.txt file40.txt file45.txt file50.txt
```

If you have a lot of numbers in your for loop, you don't need to write them all out. You can use {1..9} instead of 1 2 3 4 5 6 7 8 9. The two numbers inside curly brackets separated by two dots indicates a range of numbers for the loop

```
for number in {1..9}; do echo "mv file${number}.txt file0${number}.txt" ; done
``` 


## while loops

One of the most powerful types of loop is the while loop, because it allow you to tell bash to do something while a condition is true. Most often, this is used to read a file and execute a command based on information contained in every line. 

```
while [condition is true]; do 
     code to execute; 
done
```

We can do this at the command line in a single line of text. Let's say we want to read a file and print out the lines with some information in front of each line

```
student@ant3814:~/FILES$ lineNumber=1; while read line; do echo "Line $counter $line"; ((lineNumber++)) ; done < apol.fasta
Line 1 >seq1
Line 2 GAATTCAAGTTCTTGTGCGCACACAAATCCAATAAAAACTATTGTGCACACAGACGCGAC
Line 3 TTCGCGGTCTCGCTTGTTCTTGTTGTATTCGTATTTTCATTTCTCGTTCTGTTTCTACTT
Line 4 AACAATGTGGTGATAATATAAAAAATAAAGCAATTCAAAAGTGTATGACTTAATTAATGA
Line 5 GCGATTTTTTTTTTGAAATCAAATTTTTGGAACATTTTTTTTAAATTCAAATTTTGGCGA
Line 6 AAATTCAATATCGGTTCTACTATCCATAATATAATTCATCAGGAATACATCTTCAAAGGC
Line 7 AAACGGTGACAACAAAATTCAGGCAATTCAGGCAAATACCGAATGACCAGCTTGGTTATC
Line 8 AATTCTAGAATTTGTTTTTTGGTTTTTATTTATCATTGTAAATAAGACAAACATTTGTTC
Line 9 CTAGTAAAGAATGTAACACCAGAAGTCACGTAAAATGGTGTCCCCATTGTTTAAACGGTT
Line 10 GTTGGGACCAATGGAGTTCGTGGTAACAGTACATCTTTCCCCTTGAATTTGCCATTCAAA
Line 11 ATTTGCGGTGGAATACCTAACAAATCCAGTGAATTTAAGAATTGCGATGGGTAATTGACA
Line 12 TGAATTCCAAGGTCAAATGCTAAGAGATAGTTTAATTTATGTTTGAGACAATCAATTCCC
Line 13 CAATTTTTCTAAGACTTCAATCAATCTCTTAGAATCCGCCTCTGGAGGTGCACTCAGCCG
Line 14 CACGTCGGGCTCACCAAATATGTTGGGGTTGTCGGTGAACTCGAATAGAAATTATTGTCG
Line 15 CCTCCATCTTCATGGCCGTGAAATCGGCTCGCTGACGGGCTTCTCGCGCTGGATTTTTTC
Line 16 ACTATTTTTGAATACATCATTAACGCAATATATATATATATATATTTAT
```

Here we are giving a variable called lineNumber a value of 1. Then, we starts the while loop, telling bash to read lines in a file. We will tell it where the file is later, but it's important to know that **while** and **read** are commands interpreted by bash, **line** is just a variable name that we are choosing to represent each line of metadata as it passes through the loop we are writing. We could use any name we want, but "line" makes sense.  Then, we use ```echo```  because we want to print to the screen the word 'Line' followed by the value of the counter and then the line from the file. ((lineNumber++)) is a trick to add 1 to the variable lineNumber at each time the loop runs. Finally, we close the loop with ```done``` and give it the file to read (apol.fasta). Remember that the less than sign  ``` <```  indicates that we are sending information from the file (which we saved as a variable in line 2) on the right into the program on the left


Let's try a more challenging, but more realistic example. Lets say we have sequencing reads from five samples that we want to map to different reference genomes using the program **bwa**. We have the following metadata spreadsheet with a list of information about each sample in the following format:

|Species|Individual|Reference genome
|-|-|-| 
|Lemur_catta|LC_01|mLemcat1.fa
|Lemur_catta|LC_12|mLemcat1.fa
|Pan_paniscus|PP_09|Ptro3.fa
|Homo_sapiens|HS_01|hg38.fa
|Homo_sapiens|HS_22|hg38.fa

If we want to run bwa, we need to tell it the following information
 
```
bwa mem forward_sequencing_reads.fasta reverse_sequencing_reads.fasta reference_genome.fa -o outputFileName.sam
```

For the first line in our metadata table, that would look like this:

``` bwa mem Lemur_catta_LC_01_F.fasta Lemur_catta_LC_01_R.fasta mLemcat1.fa -o Lemur_catta_LC_01.sam``` 

But it would be a pain to write out all these lines of text, especially if you are working with hundreds of samples. We can write a **script** using a while loop to generate the code for an infinite number bwa runs!

```
#!/bin/bash

filename='bwa_metadata.txt'

while read line; do

   ID=$(echo $line | awk '{print $1_$2}')
   ref=$(echo $line | awk '{print $3}')

   echo "bwa mem ${ID}_F.fasta ${ID}_R.fasta $ref -o ${ID}.sam"

done < $filename
```
This script is a text file that we save as call bwa_runBatch.sh. It contains the full while loop and a few additional instructions to tell bash how to run it. This is a little  complicated, so let's break it down line by line.

**Line 1** 
> #!/bin/bash

This is a special line at the top of the script to tell bash what language the script is written in. This line will be a little different for other languages like python or perl.

**Line 2**
>filename='bwa_metadata.txt'

We're save the name of the metadata file that we want to use as a variable called $filename. 

**Line 3**
> while read line; do

This line starts the while loop, telling bash to read lines in a file. We will tell it where the file is later. It's important to know that **while** and **read** are commands interpreted by bash, **line** is just a variable name that we are choosing to represent each line of metadata as it passes through the program we are writing. We could use any name we want, but "line" makes sense.  

**Line 4**
>ID=$(echo $line | awk '{print $1"_"$2}')

Now that the first line of metadata has been read by bash, we can start to do things with it. Here we are using awk to split off the first to columns (Lemur_catta and LC_01) and merge them into a single string separated by an underscore (Lemur_catta_LC_01). Then we are saving it in a variable called ```ID``` to store it to be used later in the script.

**Line 5**
>  ref=$(echo $line | awk '{print $3}')

Just line in line 4, we are saving another piece of the metadata line. This time it is column 3 (mLemcat1.fa), which is the name of the reference genome. We are saving it in a variable called ```ref``` to use later in the script. Now that the first line of the metadata has been parsed and stored in variables. we can use the variables to run bwa. 

**Line 6**
>echo "bwa mem ${ID}_F.fasta ${ID}_R.fasta $ref -o ${ID}.sam"

First, we are running an ```echo``` command, because we want to print the results of everything inside the double quotes to the screen. We start by calling the program bwa mem, then we feed it four pieces of information: The forward and reverse sequencing read files, the reference genome, and the output file name. We do this by inserting the variables that we created with awk ($ID and $ref) into the string of text.

${ID}_F.fasta -> Lemur_catta_LC_01_F.fasta
${ID}_R.fasta -> Lemur_catta_LC_01_R.fasta
$ref -> mLemcat1.fa 
${ID}.sam -> Lemur_catta_LC_01.sam

**Line 7**
>done < $filename

Finally, we close the loop with ```done```. This is also the point where we give the loop the metadata file as input. Remember that the less than sign  ``` <```  indicates that we are sending information from the file (which we saved as a variable in line 2) on the right into the program on the left

So let's run our script!

```
student@ant3814:~/FILES$ bash bwa_batchRun.sh
bwa mem Lemur_catta_LC_01_F.fasta Lemur_catta_LC_01_R.fasta mLemcat1.fa -o Lemur_catta_LC_01.sam
bwa mem Lemur_catta_LC_12_F.fasta Lemur_catta_LC_12_R.fasta mLemcat1.fa -o Lemur_catta_LC_12.sam
bwa mem Pan_paniscus_PP_09_F.fasta Pan_paniscus_PP_09_R.fasta Ptro3.fa -o Pan_paniscus_PP_09.sam
bwa mem Homo_sapiensHS_01_F.fasta Homo_sapiens_HS_01_R.fasta hg38.fa -o Homo_sapiens_HS_01.sam
bwa mem Homo_sapiens_HS_22_F.fasta Homo_sapiens_HS_22_R.fasta hg38.fa -o Homo_sapiens_HS_22.sam
```
Look at that!

# Text Editors

[The following introduction to VI is taken from CSHL Programming For Biology and was originally written by Sofia Robb](https://github.com/prog4biol/pfb2023/blob/master/unix.md/#unix-2)


It is often necessary to create and write to a file while using the terminal. This makes it essential to use a terminal text editor. There are many text editors out there. Some of our favorite are Emacs and vim. We are going to start you out with a simple text editor called  `vi`

## Introduction to vi

What is **vi**?

> **vi** is a command line text editor. vi is included in every Linux installation. You don't have to install it, ever.

What is a command line text editor?

> A command line text editor is an text editor that you use from the command line. In most command line text editors, don't expect to be able to point and click. You will need to naviage with keyboard key strokes. The two most popular text editors are **vi** and **emacs**. You are free to use either, but we will start with **vi** since the keystrokes are less complex than in **emacs**.

Why do I care about command line text editors?

> If you are logged into a remote machine, a command line text editor is the fastest, easiest, most efficient way to write text files.

### Getting Started with vi

__Opening a file__

On the command line, type `vi` followed by a file name.

```bash
student@ant3814:~$ vi <file>
```
Let's try it:

```bash
student@ant3814:~$ vi first_vi_file.txt
```
You will see this in your terminal.

```
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"first_vi_file.txt" [New File]
```
Notice the file name at the bottom.

If you **do not** include a file name you will see something similar to this:

```bash
~
~
~
~
~                                                VIM - Vi IMproved
~
~                                                version 8.0.1283
~                                            by Bram Moolenaar et al.
~                                   Vim is open source and freely distributable
~
~                                          Become a registered Vim user!
~                                 type  :help register<Enter>   for information
~
~                                 type  :q<Enter>               to exit
~                                 type  :help<Enter>  or  <F1>  for on-line help
~                                 type  :help version8<Enter>   for version info
~
~
~

```
Read what the message says and type `:q<Enter>` to **Q**uit or exit.

__vi has two modes.__

1. **Insert Mode**

2. **Command Mode**

**Insert Mode** is for typing your file contents. All keyboard strokes will be interpreted as characters you want to see in your file.

**Command Mode** is for using commands. All keyboard stokes will be interpreted as commands and ***not*** as part of your file. Common commands are for deleting, copying, searching, replacing, and saving.

### Creating, Writing, And Saving a File Walk through


__Create__

From the command line open a new file by typing 

`vi first_vi_file.txt` 

__Write__

Start typing content. To do this we need to enter **Insert Mode**. 

To do this type `i`.

Your vi session will now look like this:

```bash
~
~
~
~
~
~
-- INSERT (paste) --
```

Notice the `INSERT` at the bottom of the screen.

Start typing your file contents. Remember that all keystrokes are ones you want to see in your file and that your mouse will not work.

__Save__

Now that the file contains some content let's enter **Command Mode** so that we can save our file.

1. Press the `<ESC>` key to enter **Command Mode**.
2. type `:w` (colon followed by a w) to **Save (Write)**

If you want to type some more content, enter **Insert Mode** (`i`). 

If, instead you want to exit, since you are already in Command Mode you can use the quit keystrokes `:q`

### Common Activities and vi Commands

Enter into **Command Mode** for all commands. If you are unsure that you are in **command mode**, just press the `<esc>` key. It will not hurt if you are already in **Command Mode**

__Saving and Exiting__

Remember to enter into **Command Mode** with `<esc>` key

|key stroke | meaning | 
|-----------|---------|  
|`:wq` | Save (**W**rite) and **Q**uit |   
|`:q!` | **Q**uit without Saving!!! |  
|`:w`  | Save (**W**rite) Only |  

 
Most commands within vi are executed as soon as you press a sequence of keys. Any command beginning with a colon ( : ) requires you to hit `<enter>` to complete the command.

__Getting around__

Remember to enter into **Command Mode** with `<esc>` key

|key stroke | meaning | 
|-----------|---------|  
|Arrow keys  | move the cursor around |  
|`j`, `k`, `h`, `l` | move the cursor down, up, left and right (similar to the arrow keys) |  
|`0` (zero) | move cursor to beginning of current line |  
|`^` (caret) | move cursor to beginning of current line |  
|`$`  |  move cursor to end of the current line |  
|`:n` | move to the nth line in the file |  
|`nG` | move to the **n**th line (eg 5G moves to 5th line) |  
|`G` | move to the last line |  
|`w` | move to the beginning of the next word |  
|`nw`| move forward n word (eg 2w moves two words forwards) |  
|`b` | move to the beginning of the previous word |  
|`nb` | move back n word |  


__Deleting content__

Remember to enter into **Command Mode** with `<esc>` key

|key stroke | meaning | 
|-----------|---------|  
|`x`        | delete a single character  |   
|`nx`       | delete n characters (eg 5x deletes five characters)  |  
|`dd`       | delete the current line  |  
|`dn`       | d followed by a movement command. Delete to where the movement command would have taken you. (eg d5w means delete 5 words)|  

__Undoing__

Remember to enter into **Command Mode** with `<esc>` key

|key stroke | meaning | 
|-----------|---------|  
| `u` | Undo the last action (you may keep pressing u to keep undoing)  |  
| `U` | (Note: capital)** - Undo all changes to the current line  |  

### Other Useful Tips

|key stroke | meaning | 
|-----------|---------|  
| `:set number` | display line numbers | 
| `:set nonumber` | turn off line numbers |  
| `:/[search text]` | find [this text] in your file |  
| `n` | go to next occurance of your search result |
