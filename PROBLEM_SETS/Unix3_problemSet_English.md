# Unix 3: Problem set

1) In the file [nobody.txt](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/nobody.txt), find every occurrence of "Nobody" and print out the line. First do this with ```grep```, then do it with a perl regular expression.

2) In the file [nobody.txt](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/nobody.txt), substitute every occurrence of 'Nobody' with your favorite name and write an output file with that person's name (ex. Michael.txt).

3)  Using regular expressions, find all the FASTA header lines in [unix3.fasta](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/unix3.fasta). Note that the format for a header in a FASTA file is a line that starts with a greater than symbol and is followed by some text (e.g.  `>seqName description`  where seqName is the sequence name or identifier. The identifier cannot have spaces in it. The description that follows it can have spaces.) 

4) If a line matches the format of a FASTA header, extract the sequence name and description using sub patterns (groups).
  
    -   Print sequence information in this format:  `id:seqName desc:seqDescription`
 
 5)  The enzyme ApoI has a restriction site: R^AATTY where R and Y are degenerate nucleotides. Search google for the IUPAC codes to identify the nucleotide possibilities for the R and Y. Write a regular expression to find and print all the lines of the site in the following sequence  [apoI.fasta](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/apol.fasta). 

6) GTTGCCTGAAATGGCGGAACCTTGAA is 27 nucleotide long, which means that it should be composed of 9 codons. Use regular expressions to split this into 9 codons separated first by tabs, then by new lines. Hint: you will need to use a quantifier and a subpattern


