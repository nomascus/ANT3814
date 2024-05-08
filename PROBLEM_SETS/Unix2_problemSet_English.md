# Unix2: Problem set

Use the command line to answer all the following questions. For each question, copy the line of code you used to answer the question and save it in a text file. 

1) Print your USER and HOSTNAME to screen

2)  Use an environmental variable to print a random number to screen

3) Save the following variables in bash: your name, your favorite band, the title of your favorite book, a list of 3 movies, the number 7, the number 3.141592654

4) What kind of data is each variable?

5) Use the variables to write print a sentence that lists  your name, your favorite band, the title of your favorite book, and the 3 movies

6) Multiple the two numerical variables together  

7) Add a fourth movie to the variable that is your list of 3 movies using the $( ) method 

8) Add a fifth movie to the variable that is your list of 3 movies using the ${ } method

Download the gene sequence of the human insulin gene (INS) from here: 
https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/INS_gene.fasta

9) Use grep -v to extract the header line and save it as a variable called $headerINS

10) Use grep to extract the sequence lines and save them as a variable called $sequenceINS.

11) Print $sequenceINS to the screen. Why are there spaces between each of the sequence lines? 

12) Use sed to remove the spaces in between the sequence lines. Hint: google "sed global replace" 

Download the following vcf file, and uncompress it with the ```gunzip``` command: https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/chr22.1kg.phase3.v5a.trimmed.vcf.gz

The genotypes in this VCF are indicated as follows:

Homozygous reference allele:	0|0
Homozygous alternative allele:	1|1
Heterozygous:	0|1 or 0|1			

13) Take a look at the file. How many lines are there, and how many lines are header lines vs. data lines? How many individuals are in the VCF?

14) Use the cat <( ) < ( ) approach to print the header lines and the last 10 lines 

15) Print a simplified version of the VCF that only includes the chromosome, position, reference allele, alternate allele, and the genotypes of the individuals. Save this file as clean.vcf

16) Make a version of clean.vcf that only includes lines with at least 1 position that is heterozygous. How many of these positions are there?
