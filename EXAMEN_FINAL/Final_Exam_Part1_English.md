# ANT3814 Final part 1: Unix and R

The final exam for ANT3814 will be in two parts. The first part (Monday) will cover the Unix command line and R (lessons 1-5), and the second part (Wednesday) will focus on the bioinformatics topics we learned in class (lessons 6-10). 

This is an "open book" exam, so you are free to use the material in the diapositives and google searches to answer these questions. 

Both parts of the exam are due by the end of this week (Sunday, June 23rd at 23:59). Please upload your answer sheets to the corresponding folders on StudiUM.


### Section 1: Basics of Command Line Operation

**Question 1:**  
If you are working in your home directory, how do you list all files and directories in it, including hidden ones?

**Question 2:**  
What command would you use to copy a file named `data.txt` to a directory named `backup`?

**Question 3:**  
How can you display the contents of a file named `results.txt` page by page?

**Question 4:**  
Write the command to delete a directory named `old_files` and all of its contents.

**Question 5:**  
How do you search for a specific keyword, "bioinformatics", in a file named `research.txt`?

**Question 6:**  
Explain the difference between `>` and `>>` when redirecting output to a file.

**Question 7:**  
How would you display the first 15 lines of a file named `sample.txt`?

**Question 8:**  
What is the purpose of the `man` command in Unix?

**Question 9:**  
Write the command to move a file named `results.txt` from the current directory to a directory named `output` located in the same directory.

**Question 10:**  
What command would you use to find the current working directory?

### Section 2: Bash Variables and `awk`

**Question 11:**  
How do you declare a variable named `count` and assign it the value `10` in Bash?

**Question 12:**  
Write a command using `awk` to print the second column of a file named `data.csv`.

**Question 13:**  
How do you add 5 to a variable named `num` in Bash?

**Question 14:**  
In bash, what do the environmental variables $0, $1, and $2 mean?

**Question 15:**  
What is the difference between single quotes and double quotes in bash?

**Question 16:**  
If you have two files containing many DNA sequences on separate lines. What command would you use to print only the unique lines? 

**Question 17:**  
How do you concatenate the values of two variables, `var1` and `var2`, and store the result in a new variable `var3`?

### Section 3: Regular Expressions

**Question 18:**  
Write a regular expression to match an email address.

**Question 19:**  
How would you use `sed` to replace all instances of the word "apple" with "orange" in a file named `fruits.txt`?

**Question 20:**  
What does the following `grep` command do?
```bash
grep -v 'ATG' sequences.txt
```

**Question 21:**  
Describe the function of the `.` (dot) in regular expressions.

**Question 22:**  
What does the `^` symbol represent in a regular expression?

**Question 23:**  
Write a perl command to substitute all instances of ATG for TAC in the following line of sequence ATGCGAAGGATGAAG.

**Question 24:**  
If you have a variant call file called sample.vcf, how would you print only the column names and the first 10 lines of SNPs?

### Section 4: For Loops, While Loops

**Question 25:**  
Write a `for` loop to iterate over all `.txt` files in the current directory and print their names.

**Question 26:**  
Write a `for` loop that prints the numbers 1 to 5.

**Question 27:**  
How would you use a `while` loop to read lines from a file named `input.txt` and print them?

**Question 28:**  
How would you use a while loop to print each line of a file and put the line number and a colon in front of it? For example, if the first 5 lines of a file called sequences.txt are:

```
GGGAGAGATG 
GCTGATGCGCAGAG
AATTAGGATGGAAT
AATATAGGAG
ATAGGAGAAT
```
print out the following text
```
1: GGGAGAGATG 
2: GCTGATGCGCAGAG
3: AATTAGGATGGAAT
4: AATATAGGAG
5: ATAGGAGAAT
```

**Question 29:**  
What is the output of the following script? The first 5 lines of the file metadata.txt are:

primates	
carnivores
cetaceans
felids
canids
```
#!/bin/bash

filename='metadata.txt'
while read line; do
   alignment=$(echo $line | awk '{print $1}')
   echo "iqtree2 -s ${alignment}.aligned.gb.fasta -m MFP -b 1000"
done < $filename
```

**Question 30:**  
Use a for loop to print ```is a student in ANT3814``` after each name in the following list of names Charlotte Jimmy Mikerlange Sarah

**Question 31:**  
Write a `for` loop to iterate over a list of directories (`dir1`, `dir2`, `dir3`) and create a file named `readme.txt` in each of them. Hint: read about the bash command ```touch``` to create a new empty file

**Question 32:**  
If you have a directory with 50 files where you accidentally saved  names like sample1.txx, sample2.txx, sample50.txx, write a loop to rename all files so that they end with ```txt``` instead of ```txx```.  


Sure! Here are 10 questions about the basics of R and ggplot2 for an exam in an introductory bioinformatics class:

### Section 5: R and ggplot2

**Question 33:**  
How do you install the `ggplot2` package in R? Write the command.

**Question 34:**  
Explain how you can load the `ggplot2` package after installing it.

**Question 35:**  
Write the R command to create a simple vector containing the numbers 1 to 5.

**Question 36:**  
How do you create a data frame in R with two columns: `gene` (containing gene names "gene1", "gene2", "gene3") and `expression` (containing values 10, 20, 30)?

**Question 37:**  
What is the command to extract the 6th row of a data frame named `data`?

**Question 38:**  
Write the `ggplot2` command to create a scatter plot with `ggplot(data, aes(x = variable1, y = variable2))`. Include the necessary geom function to actually plot the points.

**Question 39:**  
How can you add a title "Gene Expression Plot" to a `ggplot` scatter plot?

**Question 40:**  
Describe how you can change the x-axis label to "Gene Name" and the y-axis label to "Expression Level" in a `ggplot` plot.

**Question 41:**  
Write the R command to filter rows in a data frame `df` where the `expression` column is greater than 15.

