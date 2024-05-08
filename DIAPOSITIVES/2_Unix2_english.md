# Bash variables , awk, and sed

## Bash variables

So far, we have only worked with files and directories that have fixed names. For example, big_file.fasta and ~/COURS/FICHIERS are names that we have set in the computer. We can change these names using mv or cp, but because we have coded them to have a set name bash doesn't consider them to be variables. Of course, bash does have the ability to create variables, and we will use them a lot! Coding languages can store information in different ways, and we call this **data structures**. For the most part in this class, we are going to work with **scalar variables**, which I will usually call **scalars**  to shorten the name. Think of a scalar as any single piece of information that you want to store in a variable. This could be a number, a word, a sentence, a thousand lines of text, or any combination of characters. 

### Saving Variables
```
myName='Joe'

band='Les Cowboys Fringants'

geneSequence='GATTACA'

fastaHeader='>HM757933.1|Pan paniscus isolate PPN-8 SRY'

fastaSequence='AGAGTGAAGCGACCCATGAACGCATTCTTCGTGTGGTCTCGCGATCAGAGGCGCAAGATGGCTCTAGAGAATCC'

daysLeft=9

```
These are all scalar variables, because they are single pieces of information. Take note of a few things here.

1) When saving a scalar variable in bash, you make an equation. You write the variable name on the left of the equal sign and put the data you want to save inside the variable on the right  

2) Do not put any spaces in the variable name or in between the variable name and the data to be stored in the variable. This will bring up an error message, because bash separates pieces of information with spaces.

```
student@ant3814:~$ myName='Joe'
student@ant3814:~$ my Name='Joe'
my: command not found
student@ant3814:~$ myName = 'Joe'
myName: command not found
```

3) When naming your variables, start with a lower case letter. For many programming languages, variables named with with capital letters have special meaning. If your variable name is composed of multiple words, try starting each new word with a capital letter (this is called "camel case"). For example, a variable named myFavoriteBand is much more readable than one named myfavoriteband.

4) If you are storing text in a variable, whether it is one word or many words, you need to put the text inside quotation marks. Otherwise, bash will think each word separated by a space is a new piece of information

5) If you are saving a number inside a variable, do **not** use quotes. In the example above, bash will recognize the variable daysLeft as a number and allow you to do mathematical operations with it. However, if you saved the variable like this:  ```daysLeft='9'```, then bash will think it is text, not a number, and the variable will only work in programs that operate on text. 

This is a good time to mention how scalar variables can be classified in bash. 

**Strings**: sequences of characters, enclosed in single quotes (' ') or double quotes (" "). Strings are used for storing text data. Example: `myName="Joe"`.   If you have a mix of numbers and letters in your variable, Bash will still consider it to be a string. For example, ```fastaHeader='>Pan panascus|AMY1|AN234.2456.A' ``` is still a single string saved in a scalar variable. 

**Integers**: Bash can handle integer arithmetic, but unlike other programming languages, technically Bash doesn't have a separate integer data type. However, variables containing integers are treated as strings unless specified otherwise. Example: `daysLeft=9`

**Floating points**: non-integer numbers (that is, those with decimals and significant digits) are usually called floating points or floats in other languages. In Bash, floating-point arithmetic is not natively supported. Arithmetic operations are typically limited to integer arithmetic. However, you can perform floating-point arithmetic using external tools or commands, such as `awk`, `bc`, or `printf`, which we will discuss later.

6) It's important to choose an appropriate name for your variable. "Picking good variable names for the objects you name yourself is very important. Don't call your variables things like  `items`  or  `my_list`  or  `data`  or  `var`. Except for where you have a very simple piece of code, or you are plotting a graph, don't call your objects  `x`  or  `y`  either. All these name examples are not descriptive of what kind of data you will find in the variable or object. Worse is to call a variable that contains gene names as  `sequences`. Why is this such a bad idea? Think about what would happen if you filled your car up at a store labelled 'gas station' that sold lemonade. In computer science, names should always accurately describe the object they are attached to. This reduces possibility of bugs in your code, makes it much easier to understand if you come back to it after six months or share your code with someone, and makes it faster to write code that works right. Even though it takes a bit of time and effort to think up a good name for an object, it will prevent so many problems in the future!" - [PFB 2023](https://github.com/prog4biol/pfb2023/blob/master/pfb.md/#python-1)

#### Environmental variables

When naming variables in bash, be sure not to accidentally overwrite internal system variables, which are called environmental variables. Many of these are are stored in all capital letters. For example, the name of the current user and the computer are stored in ```$USER``` and ```$HOSTNAME``` For those of you using a copy of the Ubuntu virtual machine, these last two variables will be the same.

```
student@ant3814:~$ echo $USER
student
student@ant3814:~$ echo $HOSTNAME
ant3814
```
Does the command prompt make more sense now? Another way of writing is would be: ```$USER```@```$HOSTNAME```:```$PWD ```$

However, for those of us using our own mac OSX or linux computers, we will see something different. Imagine how a large computer server might have hundreds of different users, but it needs to make sure that each user is sent to the correct home directory. When you login, the server will allocate a special variable $USER to you so that when you type ```cd ~``` you are sent to the correct directory. 

Also, don't use any variables that are numbers, such as ```$0``` or  ```$1```, or ```$37```. These variables have special meaning in regard to the way information is passed to a script (program). Lets say that we have a program that requires two pieces of information to run. For example, a species name and a file that contains a list of species IDs.

```
student@ant3814:~$ speciesfinder.py Nomascus_concolor speciesList.txt 
```

bash interprets a series of strings on the command line as an ordered list and saves them as numerical variables starting with zero. In this case, we have   ```$0```, ```$1```, and  ```$2```. $0 is the script being run, $1 is the string Nomacscus_concolor, and $2 is the file speciesList.txt. 

What would the variables be if we wrote:
 ```
student@ant3814:~$ speciesfinder.py Nomascus concolor speciesList.txt 
```

Remember that spaces matter in Unix. Each variables is separated by a space.

_Note_: In this case the script is called speciesfinder.py. the .py ending indicates that it is a script that uses the language python to run. Scripts written in other languages are given different file endings, such as .pl (perl), .c \(C\), .java (java), and .rb (ruby). The file ending for a shell script is .sh. 



Here is a list of some common environmental variables to be aware of:

|Variable| Definition|
| ----------- | -------------- |
|**$USER**| The username of the user executing the script |
|**$HOSTNAME**| The hostname of the computer running the script|
|**$PWD** | The current working directory|
|**$HOME**| The home directory of the user|
|**$#**|How many command line parameters were passed to the script|
|**$@**| All the command line parameters passed to the script|
|**$0**| The script being used|
|**$1**| The first command line parameter passed to the script|
|**$2**| The second command line parameter passed to the script|
|**$?**| The exit status of the last process to run|
|**$$**| The Process ID (PID) of the current script|
|**$SECONDS**| The number of seconds the script has been running for|
|**$RANDOM** | Returns a random number|
|**$LINENO** | Returns the current line number of the script|


### Using Variables

After we've saved the variable in bash, how do we use it? 

```
student@ant3814:~$ geneSequence='GATTACA'
student@ant3814:~$ echo geneSequnce
student@ant3814:~$ geneSequence
```

```echo``` expects to receive a string, so when you write ```echo geneSequence``` or ```echo 'geneSequence'``` on the command prompt, it is not expecting a variable. When calling a  scalar variable, you need to tell bash that what you're typing is a scalar variable by putting a $ character in front of the variable name. I like to think of the $ as special letter S that stands for 'scalar'. 

```
student@ant3814:~$ echo $geneSequnce
student@ant3814:~$ GATTACA
```

You can also mix variables and strings together in a single line of code. 

```
student@ant3814:~$ echo "My fasta header is: $fastaHeader The corresponding nucleotide sequence is: $fastaSequence"
My fasta header is: >HM757933.1|Pan paniscus isolate PPN-8 SRY. The corresponding nucleotide sequence is:  AGAGTGAAGCGACCCATGAACGCATTCTTCGTGTGGTCTCGCGATCAGAGGCGCAAGATGGCTCTAGAGAATCC
student@ant3814:~$ 
```

If you want to split this onto multiple lines, you can add the newline character, but you have to let echo know that you are using special characters with a -e option

```
student@ant3814:~$ echo -e "My fasta header is: $fastaHeader\nThe corresponding nucleotide sequence is: $fastaSequence"
My fasta header is: >HM757933.1|Pan paniscus isolate PPN-8 SRY
The corresponding nucleotide sequence is: AGAGTGAAGCGACCCATGAACGCATTCTTCGTGTGGTCTCGCGATCAGAGGCGCAAGATGGCTCTAGAGAATCC
student@ant3814:~$ 
```
Notice here also that I used double quotes instead of single quotes. Most of the time, when you uses **single quotes**, bash will interpret the information as a string. When you want bash to interpolate the variable, make sure you use **double quotes**.

Another thing to watch out for is the spacing between your variable names and the subsequent characters in your string. Suppose you remember that there are actually 5 As at the end of the nucleotide sequence that you saved? How would you add those new characters to your variable? 

```
student@ant3814:~$ echo "$fastaSequenceAAAAA"

student@ant3814:~$ echo '$fastaSequenceAAAAA'
$fastaSequenceAAAAA
student@ant3814:~$
```
That didn't work, because bash is looking for a variable named $fastaSequenceAAAAA that doesn't exist. There are a few ways to do this. First, you can tell bash which part of the text is the variable to interpolate and which part is an additional string to stick onto the end by using curly brackets ```{ }``` after the dollar sign.

```
student@ant3814:~$ echo "${fastaSequence}AAAAA"
ATTGCTAGTCGTAGCTAGCTAGCTAGCTGTACGTGCTGTCGTAGCTGCTAGCTAGCTACGTAGCATCGTCGATCTACGTAAAAA
student@ant3814:~$
```

You could also make a new variable and print the two variables together. 

```
student@ant3814:~$ fasta5Atail='AAAAA' 
echo "$fastaSequence$fasta5Atail"
ATTGCTAGTCGTAGCTAGCTAGCTAGCTGTACGTGCTGTCGTAGCTGCTAGCTAGCTACGTAGCATCGTCGATCTACGTAAAAA
student@ant3814:~$
```
Or could save $fastaSequence as the combination of $fastaSequence and $fasta5Atail

```
student@ant3814:~$ fastaSequence=$fastaSequence$fasta5Atail
student@ant3814:~$ echo $fastaSequence
ATTGCTAGTCGTAGCTAGCTAGCTAGCTGTACGTGCTGTCGTAGCTGCTAGCTAGCTACGTAGCATCGTCGATCTACGTAAAAA
student@ant3814:~$
```
Take note of an important point here: **bash variables can be overwritten** when you save them as something else. The variable on the left side of the equation doesn't exist until the code on the right side of the equation has been executed. Even if you already saved a variable with the name $fastaSequence, the "new" definition of $fastaSequence, isn't saved until $fasta5Atail is added to the "old" definition of $fastaSequence. 

```
#### Complex Variables
You can also save the output of a command in a variable. In the last class, we used ```sort``` and ```uniq``` to remove duplicate lines from multiple concatenated files.

```student@ant3814:~/COURS/FICHIERS$ cat file1.txt file2.txt | sort |uniq
student@ant3814:~/COURS/FICHIERS$ 
Jane
Jean
Joe
John
Luca
Michelle
Nathalie
Rose
student@ant3814:~/COURS/FICHIERS$
```
We can save this result (standard output) as a variable if we put the entire command line into a variable by wrapping it in parentheses with a dollar sign

```
student@ant3814:~/COURS/FICHIERS$ uniqNames=$(cat file1.txt file2.txt | sort |uniq)
student@ant3814:~/COURS/FICHIERS$ echo $uniqNames
Jane Jean Joe John Luca Michelle Nathalie Rose
student@ant3814:~/COURS/FICHIERS$
```
#### Bash Arithmetic

bash  isn't very good at math, but you can ask it to do simple integer operations by putting the math inside a variable with two sets of parentheses

```
student@ant3814:~$ echo $(( 4 + 2 ))
6
student@ant3814:~$ 
```
You can also save this as a variable to call directly

```
student@ant3814:~$ additionResult=$(( 4 + 2 ))
student@ant3814:~$ echo $additionResult
6
student@ant3814:~$ 
```
Or  if you like, you can also use a saved variable in the equation
```
student@ant3814:~$ echo $(($daysLeft / 3))
3
student@ant3814:~$ 
```

Math in bash is a little more complicated if you want to use **floats**. To do this you will need to pipe the math equation into a different program like ```awk```, ```bc``` or ```printf```.

```
student@ant3814:~$ echo "3.14 * 2" | bc -l
6.28
student@ant3814:~$ echo "7.9 / $daysLeft" | bc -l
.87777777777777777777
student@ant3814:~$ 
```

## Modify streaming output with awk and sed

awk and sed are two other commonly used commands for parsing the kind of text files that we're going to encounter. They are actually independent languages that can be called from the bash command line, so there is a lot they can do! We will focus on a few specific tasks. 

Sometimes you have a file with many columns and you are only interested in a few of them. You can use ```cut``` to parse a data table, but it is limited and sometimes struggles with certain files. awk is much more flexible. Let's start by working with the ***variant call file (VCF)**, named sample.vcf . Let's start by taking a look at the first 3 lines and the last 3 lines to get a better idea of what this kind of file looks like. We can do that that by calling both ```head``` and ```tail``` on sample.vcf. 

```
student@ant3814:~/COURS/FICHIERS$ head -3 sample.vcf
##fileformat=VCFv4.2
##FORMAT=<ID=AD,Number=R,Type=Integer,Description="Number of observation for each allele">
##FORMAT=<ID=AO,Number=A,Type=Integer,Description="Alternate allele observation count">
student@ant3814:~/COURS/FICHIERS$ tail -3 sample.vcf
Chr1  413091  .  A  G  254.981  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:64:45,18:45:1678:18:633:-37.9319,0,-131.909
Chr1  413209  .  A  G  434.144  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:70:47,23:47:1789:23:837:-54.5579,0,-140.169
Chr1  425805  .  G  A  28.7684  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:29:30:23,7:23:878:7:262:-13.9201,0,-68.3644
student@ant3814:~/COURS/FICHIERS$
```

 A fun trick, and more convenient way to do this is by calling both ```head``` and ```tail``` in the same line and sending the results of both to ```cat```, because the script ```cat``` can receive multiple command line parameters. We could save the output of these two commands into variables named $vcfHead and $vcfTail, then cat both.
```
student@ant3814:~/COURS/FICHIERS$ vcfHead=$(head -3 sample.vcf)
student@ant3814:~/COURS/FICHIERS$ vcfTail=$(tail -3 sample.vcf)
student@ant3814:~/COURS/FICHIERS$ cat $vcfHead $vcfTail
``` 
In this case ```cat``` interprets ```$vcfHead``` as ```$1``` and ```$vcfTail``` as ```$2```. However, bash can also interpret the results of the the calls to ```head``` and ```tail``` without the need to save them as variables  by redirecting standard standard input from the command line using the following syntax:

```cat <(head -3 sample.vcf) <(tail -3 sample.vcf)```. 
 
Here, we are telling bash that the text within the sets of parentheses should be executed first, then the results should be redirected to ```cat``` in order from left to right.  Think of it as this structure: ```program  <(command) <(command) ``` 


Anyway, back to the VCF. What we see at the top are many lines with information about the file, each of which starts with two **hash marks (#)**. These are called header lines. Headers are commonly indicated by starting with a #, which is the standard way of indicating that a line should be treated as a comment rather than a line of data. The rest of the file contains lines of information about single nucleotide polymorphisms (SNPs). Let's get rid of the ## headers and look closer:

```
student@ant3814:~/COURS/FICHIERS$ grep -v "##" sample.vcf | head -3
#CHROM  POS  ID  REF  ALT  QUAL  FILTER  INFO  FORMAT  SampleName
Chr1  534  .  G  A  386.826  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:53:33,20:33:1159:20:728:-49.4602,0,-88.5576
Chr1  558  .  T  C  616.84  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:51:26,25:26:901:25:949:-70.1497,0,-65.8674
```
What we can see here is a second type of header line that starts with a single hash mark. This header gives the names of each column, which are Chromosome, Position, ID, Reference allele, Alternative allele, Quality score, Filtration parameter, Other information, Format of the sample data, Sample data. We will talk more about VCFs later, but for now we just want to clean up the file so we can read it more clearly. 


### awk
Let's print our columns 1,2,4,5, and 10.  For each SNP, that will give us the chromosome, position, reference allele, alternative allele, and the sample information. We can do this by piping the ```grep -v``` output into ```awk```.


```
student@ant3814:~/COURS/FICHIERS$ grep -v "##" sample.vcf | awk '{print $1"\t"$2"\t"$4"\t"$5"\t"$10}' | head 
#CHROM  POS  REF  ALT  SampleName
Chr1  534  G  A  0/1:99:53:33,20:33:1159:20:728:-49.4602,0,-88.5576
Chr1  558  T  C  0/1:99:51:26,25:26:901:25:949:-70.1497,0,-65.8674
Chr1  709  A  G  0/1:99:62:37,22:37:1313:22:746:-49.2234,0,-100.363
Chr1  765  C  G  0/1:99:58:36,21:36:1295:21:712:-46.6599,0,-98.3786```
```
Now we can see the more clearly. There is still a lot of messy information that we don't care about in the last column, but we'll get to that in a moment. Let's explain the ```awk``` call first. 

1) Because awk is it's own language, it has it's own syntax and the awk statement needs to be put into quotes.  
```awk ''```

2) awk can do a lot of things, and if we only want it to print something, we need to tell it to use it's internal print function, which is called ```print```, which we will put in a separate block of code, surrounded by curly brackets.  
```awk '{print}'```

3) Then we need to tell ```awk``` what to print. ```awk``` codes each column as a numerical variable. So the first column is $1, the 5th column is $5, and so on.  
```awk '{print $1$2$4$5$10}'```

4) Finally, we need to tell ```awk``` what kind of character to use to separate each column  that it is printing. These characters are strings, so we'll need to put them in quotes. A tab character is the most clear, way to do this, so let's insert the special character for tab ```\t``` 
```awk '{print $1"\t"$2"\t"$4"\t"$5"\t"$10}'```

What makes awk so flexible here is that you can reorganize the columns in anyway you like and put anything between them. Give it a try! 

### sed 

Much like ```awk```, ```sed``` is it's own language, but it does very different things. sed is particularly good at doing search and replace. The basic sed structure that we will be working with looks like this: 

```sed 's/ / /'```

The s indicates that you are asking sed to perform a substitution. The three forward slashes are written to separate two spaces into which you can place the text to be searched for, followed by the text you are replacing it with. Lets look at file4.txt. 

```
student@ant3814:~/COURS/FICHIERS$ cat file4.txt
framboise
pomme
raisin
orange
```
Suppose we want to replace 'pomme' with 'pomme de terre'. we could do this with ```sed```:

```
student@ant3814:~/COURS/FICHIERS$ sed 's/pomme/pomme de terre/' file4.txt
framboise
pomme de terre
raisin
orange
```
We can also replace one or more letters letters with anything we want

```
student@ant3814:~/COURS/FICHIERS$ sed 's/m/T/' file4.txt
frambTise
pTmme de terre
raisin
Trange

student@ant3814:~/COURS/FICHIERS$ sed 's/s/\n/' file4.txt
framboi
e
pomme
rai
in
orange
```
If we want to delete certain characters, we can do with by leaving the last space empty
```
student@ant3814:~/COURS/FICHIERS$ sed 's/m//' file4.txt
fraboise
poe
raisin
orange
```
One especially powerful thing about sed is that we can also use **wildcards**.  We will talk about this more when we get to regular expressions, but for now know that the point character ```.``` is the wildcard for "any character that is not a space" and the plus sign ```*``` means "zero or more of of the previous characters". Thus, ```.*``` means anything from this position in the line to the end of the line.

```
student@ant3814:~/COURS/FICHIERS$ sed 's/o.*//' file4.txt
framb
p
raisin
```
So let's tie this all together to finish editing our VCF. 

```
student@ant3814:~/COURS/FICHIERS$ grep -v "##" sample.vcf | awk '{print $1"\t"$2"\t"$4"\t"$5"\t"$10}' | sed ' s/:.*//' |head -5

#CHROM  POS  REF  ALT  SampleName
Chr1  534  G  A  0/1
Chr1  558  T  C  0/1
Chr1  709  A  G  0/1
Chr1  765  C  G  0/1
```
You can see now that it's very clean. The ```sed``` command ```sed ' s/:.*//'``` searched for the first colon in the line, then removed the colon and anything following it on the line.

