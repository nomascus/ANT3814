# Unix 3

## Regular expressions

So far we've introduced a few ways to search and replace text at the command line. The first was the use of the wildcard character **\***, which at the command line means "one or more of any character". For example,
```
student@ant3814:~$ ls *.txt
file1.txt
file2.txt
file3.txt
file4.txt
```

In this case, we're asking ```ls``` to list any files that end in .txt. We could do the same  like this

```
student@ant3814:~$ ls fi*xt
file1.txt
file2.txt
file3.txt
file4.txt
```
Note that there is no difference in the outcome if we ask for any file that ends in '.txt' or any file that starts with 'fi'  and ends in 'xt'. However, if we search for files ending in '.tx', we won't find any

```
student@ant3814:~$ ls *tx
ls: *.tx: No such file or directory
```

We also introduced ```grep``` to find lines that match in a file and the `sed`  language that lets us edit streaming text using search and replace characters

```
student@ant3814:~$ echo "This is ANT3841" | sed 's/41/14/'
This is ANT3814
```

However, there is a much more powerful way of manipulating text on the command line and in files using **regular expressions**, which is a language of pattern matching that uses specific characters that have secondary meanings. We've already learned about a few of these, like **\n**, which means new line and **\t** that means tab. In this case, the backslash ```\``` is called the "escape character", because it indicates that the language shouldn't interpret the two characters literally, but rather that putting a backslash in from of the character switches to the secondary meaning of the character (or it escapes the standard meaning). These character combinations are called 'atoms', because they can be combined into more complex forms. Not all regular expression atoms use the escape character, but many do.

### Regular expression atoms

|Type|Atom|Description|Example
|-|-|-|-|
Character|[ ]| any one of the characters in the brackets| /[AtG]/
Character|[^]| NOT any character in the brackets|/[^AtG]/
Character|[a-z]|an ordinary lower case letter|/GAT[A-Z]ACA/
Character|[A-Z]|an ordinary upper case letter|/GAT[A-Z]ACA/
Character|\d| any single digit [0-9]| /file\d\.txt/
Character|\D| NOT a digit [^0-9]|/\D\D\D\D\d.txt/
Character|\w| any single word character [A-Za-z0-9_]|/file3\.\wxt/
Character|\W| NOT a word character [^A-Za-z0-9_]|file\W\Wtxt
Character|\s| any white space character [ \n\t\r]| /Chr1\s536/
Character|\S| NOT white space [^ \n\t\r]| //Chr1\s\S36//
Character|.| any single character| /GA.TT/
Character|\\.| a single period| /GA\\.TT/
Anchor|^| atom matches the start of the text string|/^>Fasta header/
Anchor|$| atom matches the end of the text string |/ATGACA$/ 

#### Examples

Remember that when searching, we will use the two forward slash structure
 ```/what I'm searching for/```

 ```/p...e/```  would match the strings 'pomme', 'pTd9e' and 'pomme de terre ' .  
 
```/p[omme][omme][omme]e```  would match 'pomme', but it would also match strings like 'pemme', 'pmmme' and 'pooom'

```/\w\w\w\d\d\d/``` would match ANT3814 and ANT2440

```/\d/d/d/-d\d\d\d/``` would match a phone number like 555-1212. It would also match a pattern like this 5555-1212, but not one like this 514-555-1212

```/^\d/d/d/-d\d\d\d/``` would match 555-1212 also 555-121212
 
```/^\d/d/d/-d\d\d\d$/``` would only match a seven digit phone number like 555-1212 (three digits followed by a dash and four digits)

### Regular expression quantifiers

Rather than typing the same characters over and over again, we can use a group of regular expressions called **quantifiers** that indicate the number of repetitions for a character

|Type|Atom|Description|
|-|-|-|
Quantifier|?| atom matches zero times or exactly once
Quantifier|*| atom matches zero or more times
Quantifier|+| atom matches one or more times
Quantifier|{3}| atom matches 3 times
Quantifier|{2,5}| atom between 2 and 5 times inclusively
Quantifier|{4,}| atom matches 4 or more times 

```/pomm?e/``` would mach pomme and pome
```/pommS?e/``` would match pomme or pommSe
```/p.+e/```  would match the strings 'pomme', 'pluie' 'pTdse' and 'pomme de terre ' 
```/^p.+e$/```  would match the strings 'pomme', 'pluie' 'pTdse' and 'pomme de terre ' 
```/p.*e/```  would match the strings 'pomme', 'pluie', pTd9e', 'pe' and 'pomme de terre'   
``` /^d{3}-d{4}$/``` would only match a seven digit number like 555-1212 (three digits followed by a dash and four digits)
 
#### Methylation sites example

Lets try something a bit more complicated and realistic. Suppose that we want to search for a methylation site inside a nucleotide sequence. To do so, the sequence needs to meet the following criteria:

Starts with G or A
followed by C
followed by any single nucleotide or nothing
followed by G

That could be a match to any of the following 

GCAG
GCTG
GCGG
GCCG
GCG
ACAG
ACTG
ACGG
ACCG
ACG

Searching for each of these individually would be very slow, but with regular expressions, we can search for any of them in a single line of text!

```/[GA]C[ATCG]?G/'```


### Either or

Sometimes we want to search for one of two complex patterns. We can do that with a pipe character ```|``` and a set of parentheses ```( )```. Let's look at some lines from the children's song, "Alouette".

*alouette, gentile alouette
alouette, je te plumerai
je te plumerai la tête
je te plumerai le bec
je te plumerai les yeux
je te plumerai le cou
je te plumerai les ailes
je te plumerai les pattes
je te plumerai la queue
je te plumerai le dos*

Suppose we want to search for the lines that have 'la queue' or 'le bec' in them. 

```/je te plumerai (la queue|le bec)/```

This matches any string that:
- contains the words je te plumerai separated by single spaces
- is followed by la queue or le bec separated by a single space

What would happen if we excluded the (either|or) statement?
```/je te plumerai/```

What if we added a question mark at the end?

```/je te plumerai (la queue|le bec)?/```

What if we added added a space after la queue?

```/je te plumerai (la queue |le bec)?/```


## Regular expressions at the command line with perl

Lets try a few of these out. Rather than using ```sed``` which is a bit limited in it's functionality, we can use another more robust language called **perl**. Perl is an extremely powerful coding language that used to be more common, but is mostly being replaced with **python**. Nonetheless, perl is still the best language for regular expressions and easily called from the command line. If we want to stream text into perl to use regular expressions type, ```perl -lpe ' '``` The '-lpe' options tells perl that the incoming command should be executed ( e ) line by line ( l ) and printed ( p ). Be careful though! The ```-lpe``` option will print all lines in the file (even those that dont't match) changing only those that you tell it to. A safer way is to tell perl to use the ``` -lne``` option that does not automatically print all lines. If you want  to print only the lines that match the conditions, you can tell perl to "print if", using the following structure:

For matching:  ```perl -lne ''print if //' file.txt```
For substitution:  ```perl -lne ''print if s///' file.txt```

Instead of putting the file at the end, you can also cat the file or echo the text into perl like this

For matching:  ```cat file.txt | perl -lne ''print if //' ```
For substitution:  ```echo 'here is some text' |perl -lne 'print if s///' ```
 
Let's start with a string of nucleotides and search for some motifs.  Just like sed, perl uses forward slashes to separate the text to search and replace. 
 
```
student@ant3814:~$ 
echo 'Ce text est dans le mauvais ordre' | $perl -lpe 's/mauvais/bon/ ' 
```


### Multiple matches

Sometimes we have more than one instance of matching text in a string

```pomme raisin framboise pomme orange```

but a regular expression will only act on the first match it finds

```
student@ant3814:~$ echo 'pomme raisin framboise pomme orange' | perl -lpe 's/pomme/ananas/'
ananas raisin framboise pomme orange
```
if you want to  operate on all the matches in a line, you need to do a **global** search by adding 'g' to the end of the expression. 

```
student@ant3814:~$ echo 'pomme raisin framboise pomme orange' | perl -lpe 's/pomme/ananas/g'
ananas raisin framboise ananas orange
```
This is particularly important when operating on highly repetitive text, like nucleotide sequence. Suppose you wanted to change a DNA sequence to RNA by  switching all the Thymine nucleotides to Uracil.

```
student@ant3814:~$ echo 'ATCGTCGTATGCGTATGCTGATA' | perl -lpe 's/T/U/'
AUCGTCGTATGCGTATGCTGATA
```

As you can see, perl only acts on the first Thymine, which isn't very helpful. Try it now with a global search

```
student@ant3814:~$ echo 'ATCGTCGTATGCGTATGCTGATA' | perl -lpe 's/T/U/g'
AUCGUCGUAUGCGUAUGCUGAUA
```


### Subpatterns

Regular expressions also allow you capture subpatterns in text and move them around by breaking the text into parts within parentheses. For example, if we wanted to change

```Ce ordre est dans le bon texte``` into ```Ce texte est dans le bon ordre```

we start by breaking into four pieces, which correspond to numbered scalar variables in perl

|Text|Variable| regular expression
|-|-|-|
|Ce|$1|^(\w+ )| 
|order|$2|(order)|
|est dans le bon|$3|(.+)
|texte|$4|(texte)$|

Then we use a substitution ``` s/// ``` to reorder the variables
```
echo 'Ce ordre est dans le bon texte' | perl -lpe 's/^(\w+ )(ordre)(.*)(texte)/$1$4$3$2/'
Ce texte est dans le bon ordre
```

Or suppose we had a fasta file with header that was very messy and we wanted to reorganize and simplify

```
>NC_19939459.0 Homo_sapiens_A87w889 FOXP2 ISOFORM_X1.9982
ATGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
```

Let's change the header to ```>FOXP2 Homo sapiens```

```
student@ant3814:~$ perl -lpe 's/.*(Homo_sapiens).*(FOXP2).*/>$2 $1/' FOXP2.fasta
>FOXP2 Homo_sapiens
ATGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
```

What if we had a fasta file with sequences from multiple species in it?

```
>NC_19939459.0 Homo_sapiens_A87w889 FOXP2 ISOFORM_X1.9982
ATGTCGTTGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>NC_2943459.0 Pan_troglodytes_A4 FOXP2
ATGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>NC_5559.0 Gorilla_gorilla_K49 FOXP2 ISOFORM_x2s
TTGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>KA_ds39459.0 Nomascus_concolor_A87w889 FOXP2 isoform 1
CTGTGGATGCCGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
```
We would need to use a more generic regular expression
```
student@ant3814:~$ perl -lpe 's/>.* (\w+_\w+) (FOXP2) .*/>$2 $1/' FOXP2_long.fasta
>FOXP2 Homo_sapiens_A87w889
ATGTCGTTGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>FOXP2 Pan_troglodytes
ATGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>FOXP2 Gorilla_gorilla_K49
TTGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>FOXP2 Nomascus_concolor_A87w889
CTGTGGATGCCGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
```

That gets us pretty close, but what if we want to remove the text following the additional underscore?

```
student@ant3814:~$ perl -lpe 's/>.* (\w+_\w+)_\w+ (FOXP2) .*/>$2 $1/' FOXP2_long.fasta
>FOXP2 Homo_sapiens
ATGTCGTTGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>FOXP2 Pan_troglodytes
ATGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>FOXP2 Gorilla_gorilla
TTGTCGATGCTGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
>FOXP2 Nomascus_concolor
CTGTGGATGCCGACTGATGCTACTAGCTGGAGGGATGTGATATTACGGCTAGTTGCGCGCCCTGTGCATGAT
```

Link to today's problem set:

English: [Unix3 problem set](https://github.com/nomascus/ANT3814/blob/main/PROBLEM_SETS/Unix3_problemSet_English.md)  
French: [Unix3 problem set](https://github.com/nomascus/ANT3814/blob/main/PROBLEM_SETS/Unix3_problemSet_Francais.md)

Useful website for testing regular expressions
https://regex101.com/
