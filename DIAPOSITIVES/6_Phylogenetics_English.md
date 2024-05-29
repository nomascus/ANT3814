# Molecular Phylogenetics

## Downloading nucleotide sequences

In order to build a phylogenetic tree, we need to start by downloading some data. It's important that the nucleotide sequences we use come from the same region of the genome for each species. This is because we want to compare the how the same positions in the genome vary across a large number of species.

Let start by going to genbank, which is a database of publicly available DNA sequences run by the National Institutes of Health (NIH). There are many different databases within NCBI that store molecular data, but we are going to work with nucleotide data today.

> https://www.ncbi.nlm.nih.gov/nucleotide/

You can search for any kind of nucleotide sequence that you want here, because it is catalogued from submissions made by scientists when we publish our papers. Let's start by looking for a mitochondrial dna from primates. Typing in the species name (or sometimes the common name) followed by "mitochondrion" will give us a list of the available human mitochondrial sequences. There are many. Sometimes for other less well studies species, you might only find fragments of genes or a few individuals, but databases like genbank grow and become more complete over time. The genbank file will provide a lot of information about the sequence, especially about which genes are in which region of the nucleotide file. Today, we just want to download the fasta sequences, so you can do that by clicking on **send to**, then **file**, then change the format to **fasta**

Download the mitochondrial genomes file from here: 

https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/DNA/primate_mitogenomes.fasta

Let's take a look at the file with the ```less``` command.  Remember the format of a fasta file? 

There are two types of lines: headers that start with a ```>``` character and then sequence lines. A fasta file with multiple sequences in it can be distinguished by the pattern of lines, because every line that starts with the greater than symbol is a new sequence.

Let's take a look at the file in a way that makes the differences a little more clear by opening the file with an alignment viewer called AliView. 

What we see here is each sequence in a row. The headers are on the left and the sequence is on the right. Each type of nucleotide has a different color A is green, T is red, C is blue, and G is gray. 

Notice how there appears to be a pattern in some places but not others. The nucleotides in the first few columns are mostly aligned, but it seems to get out of order around position 20. Also, let's scroll to the end of the files and see how it gets much messier. By then end, we can also see that not all the files are the same length. If we want to compare the nucleotides at each position across all the species, we need to align them.

## Sequence alignment

Sequence alignment is a complicated process, and we won't go into much detail here. However, the basic idea is that similar regions of DNA can be lined up across all the sequences, because all species share an evolutionary history.  Over time, DNA sequences will become increasingly different between a pair of species as a result of mutation, drift, and selection. When we align two sequences that have diverged from each other, of course they will not align perfectly. Some nucleotides will differ because of mutation. However sometimes there will be an insertion or a deletion of one of more nucleotides in the sequence of one species that can cause the appearance of a shift in the sequence. In order to compensate for these insertions and deletions, we have to introduce gaps into the alignment for some species. 

Let's align our sequences with a program called **mafft**. mafft is very fast and can automatically choose the options for your alignment. Save the alignment as primate_mitogenomes.aligned.fasta

```
student@ant3814:~/PHYLO$ mafft --auto primate_mitogenomes.fasta > primate_mitogenomes.aligned.fasta
```

Now let's take a look at the aligned file in AliView. Notice first that there are only two species with sequence at the start of the alignment, human and cat. The rest of the species cannot be aligned here and just have gaps signified by the dash marks. This is likely the result of the files being slightly different lengths. Lets skip ahead to where the alignment becomes visible for all the species, around position 976. We can see that there are some very conserved regions, where the sequence does not vary much, like positions 1000 - 1020, but in other areas, there is lots of variation, like 1030 - 1040. Sometimes this is the result of the DNA region being part of a gene that is under selection pressure to not change. Other times it could be a region of the genome that is just difficult to align.

## Alignment cleaning

In general, alignments with lots of gaps cause problems for phylogenetic tree construction, so we need to clean up this alignment by removing these poorly aligned regions. Choosing which regions to remove is a challenging process that can be overwhelming when constructing multiple alignments from different gene regions. Fortunately, programs have been developed to automate this process. We can use one called **Gblocks**.

```
student@ant3814:~/PHYLO$ Gblocks primate_mitogenomes.aligned.fasta -t=d
```
the -t=d options lets the program know that these are DNA sequences. The cleaned alignment file is named primate_mitogenomes.aligned.fasta-gb but lets rename that to keep fasta at the end

```
student@ant3814:~/PHYLO$ mv primate_mitogenomes.aligned.fasta-gb primate_mitogenomes.aligned.gb.fasta
```
Now, let's take a look at the cleaned alignment. See how much better this looks? we've gotten rid of all the poorly aligned regions, and we can start to how patterns of relationships might be present in the data  

**Note** Gblocks doesn't like header names that are too long. If you get an error about this, be sure to shorten them by editing the names in vi.

## Build tree with IQTREE

There are many different programs and methods to building phylogenetic trees. These include neighbor-joining, UPGMA, maximum likelihood, and Bayesian approaches, among others. Many universities have an entire biology class dedicated to molecular phylogenetics, but our goal today is to construct a tree from our mitochondrial data so that you can understand the basics of how this process works. We are going to use a program called IQTREE to build a maximum likelihood tree. 

The first step in the tree building process is to identify the nucleotide **substitution model**, which is a model of how likely it is that one kind of nucleotide (or amino-acid) will change into another. For instance, how likely is it that a purine will change into another purine as opposed to a pyrimidine. These models filter the complexity of the biological mutation process into simpler patterns that can be described and predicted using a small number of parameters. Substitution models attempt to predict the rate of substitution for nucleotides or at a given site, and also the distribution of substitutions across the entire sequence. This is a very complicated process, but fortunately, IQTREE will automate it for us.

```
student@ant3814:~/PHYLO$ iqtree2 -s primate_mitogenomes.aligned.gb.fasta -m MFP
```

We can see from the output that the GTR+F+I+G4 model best fits the data. Now, let's use this information to reconstruct the phylogenetic tree 

```
student@ant3814:~/PHYLO$ iqtree2 -s primate_mitogenomes.aligned.gb.fasta -m GTR+F+I+G4 
```

Lets open the tree file and look at it in ```figtree``

``` student@ant3814:~/PHYLO$ figtree```

Notice here that the tree looks a little weird. This is because it is an **unrooted** tree. that means that we have not assigned one of the species as the known outgroup to the rest of the species. For example, if we had a small tree of chimps, gorillas, and humans and macaques, we could set macaques as the root of the tree, because we know they are the most distantly related. We can do the same thing here in our tree. We know that cats and dogs are both carnivores, and more distantly related to the other species in our tree. Lets pick the carnivores as the root, by clicking on the branch leading to cats and dogs and then clicking **reroot**. Now the tree looks much more sensible!

There is one more thing we need to do. We have found the splits between taxa with our tree, but we don't know how reliable these splits are. Should we trust them? We can test the reliability of a sequence-based phylogeny using a statistical process called **bootstrapping** . Bootstrapping reshuffles the input data many times and randomly draws different species to create a new reshuffled alignment, which IQTREE then uses to build a new tree. This processes is repeated many times and we until we get a score of how many times each branch in our initial tree is found in the bootstrap replicate trees.  Bootstrap values in a phylogenetic tree indicate that out of 100, how many times the same branch is observed when repeating the generation of a phylogenetic tree on a resampled set of data. Let's run 1000 bootstrap replicates


```
student@ant3814:~/PHYLO$ iqtree2 -s primate_mitogenomes.aligned.gb.fasta -m MFP -b 1000 --undo
```

Here the --undo option indicates that we want to use the previous tree and just change some options in the command. Now let's open the new tree in figtree and view the bootstrap labels on the branches. 

You can see how most of the nodes have bootstrap scores of 100. This means that in all 1000 tree replicates IQTREE found the same split. For example humans are always more closely related to the two chimpanzee species than either is to gorillas. However, the IQTREE had a little more difficulty places rabbits and tree shrews. The same is true for the howler monkey and spider monkey. In general, the rule is that you want to have a bootstrap value of at least 95 to trust the split.

Overall, this is a well resolved tree, but it's not perfect. Remember that we are just using mitochondrial DNA here. We would probably have more confidence if we used many different gene regions at the same time. Still, it's pretty remarkable that we can correctly identify the phylogenetic relationship among primates with such a small amount of information!

***

**Problem Set 6: Phylogenetics**

1) Download the [primate_mitogenomes.fasta](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/DNA/primate_mitogenomes.fasta). Use bash to print out the headers from each species in primate_mitogenomes.fasta file

2) Download the nucleotide sequences of the gene  MYH1 from 5 primates and one non-primate mammal (to use as an outgroup). Be sure to download them in fasta format

3) Concatenate the 6 fastas into a single fasta

4) Align your fasta sequences with mafft

5) Open the algnment file in mafft and find a conserved region and a variable region. Take a screenshot of each region and paste it here

6) Build a maximum likelihood tree with IQTREE using 1000 bootstraps. 

7) Open the tree in figtree, reroot it using the outgroup, and add the bootstrap values. Paste a screenshot of the tree here.
