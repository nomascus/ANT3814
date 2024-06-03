## Testing for natural selection with codon models

One way to identify natural selection is to search test for the amount of mutations that have caused amino acid changes in protein coding genes. These types of test are done by comparing the ratio of non-synonymous to synonymous changes in one or more species to the ratio in other species in a phylogenetic tree.

Remember that each protein sequence is composed of amino acids that are coded for by groups of three nucleotides, called codons. For example:

AAA, AGG,	TTC 

codes for 

Lysine (K), Arginine (R\), Phenylalanine (F)

But if you change the sequence to 

AA**G**, AGG,	T**C**C  

it codes for 

Lysine (K), Arginine (R\), Serine (S)

The first substitution AA**A** -> AA**G** did not cause an amino acid change (Lysine in both cases), and is thus called a **synonymous** substitution. Generally, these substitutions have no effect on the protein.

The second substitution AA**A** -> AA**G** did  cause an amino acid change (Phenylalanine to Serine), and is thus called a **non-synonymous** substitution. These substitutions can have a major effect on the protein.

The ratio of synonymous to non-synonymous substitutions in a gene is called the **dN/dS ratio**. 
When the  **dN/dS ratio**. 

dN/dS|Selection|Interpretation|
|---|---|---|
|dN/dS < 1|  Negative (purifying) |Harmful mutations are removed keeping the DNA sequence conserved
|dN/dS > 1|  Positive (diversifying) | Beneficial mutations have occurred, and are maintained
|dN/dS ~ 1|  None (neutral) | Mutations have little effect and while the DNA sequence changes, it has little effect on the species 

### Testing for selection with aBSREL and RELAX

There are many different programs that use dN/dS ratios to test for selection in one species relative to other closely related species. The most widely used program is called PAML, but it is not very user friendly. We are going to use a package called HyPhy that includes many different programs for the analysis of natural selection. Each of these programs tests for selection in slightly different way. For example, some of them look for evidence of selection on a single branch of a phylogeny. This could be an individual species (for example, humans) or the ancestral branch that leads to multiple species (for example, the branch leading to humans, chimpanzees, and bonobos).  

aBSREL (**a**daptive  **B**ranch-**S**ite  **R**andom  **E**ffects  **L**ikelihood) tests if positive selection has occurred on a proportion of branches. aBSREL will test, for each branch (or branch of interest) in the phylogeny, whether a proportion of sites have evolved under positive selection using a Likelihood Ratio Test.

We can run aBSREL in the HyPhy package, 

```
hyphy absrel ADH_nucleotide_RELAX_alignment.nex``` 
```
In this case we are looking for dN/dS values that are significantly >1 on each branch of the phylogenetic tree for the ADH7 gene. This gene is involved in alcohol metabolism. Great apes are known to have a substitution that increases the ability to metabolize alcohol, which gives us a higher tolerance. Rotting fruit on the ground ferments, and many animals have been observed eating it and appearing to get drunk. 

The aBSREL results are saved in a JSON file that can be opened online in [hyphy vision](vision.hyphy.org). The only branch with  significant evidence of positive selection (p < 0.05) is the branch leading to elephants (node 140). 

```
wget https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/ADH_nucleotide_RELAX_alignment.label.nex
```


RELAX is a hyphy program that uses a hypothesis testing framework to ask whether the strength of natural selection has been relaxed or intensified along a specified set of test branches. RELAX is therefore  _not_  a suitable method for explicitly testing for positive selection. Instead, RELAX is most useful for identifying trends and/or shifts in the stringency of natural selection on a given gene.

RELAX requires a specified set of "test" branches to compare with a second set of "reference" branches.  RELAX then tests for relaxed/intensified selection by introducing the parameter  **k**  (where  k≥0), serving as the  _selection intensity parameter_. RELAX then conducts a Likelihood Ratio Test to compare the alternative and null models. A significant result of  **k>1 indicates that selection strength has been intensified**  along the test branches, and a significant result of  **k<1 indicates that selection strength has been relaxed**  along the test branches.

RELAX requires a data set with a codon alignment and a phylogenetic tree that labels species belonging to different groups of interest.

```
hyphy relax --alignment  ADH_nucleotide_RELAX_alignment.label.50Plus.nex --test Fruit-Nectar --reference OTHERDIETS
```


# Problem set

> install hyphy on the virtual machine

```
git clone https://github.com/veg/hyphy.git
cmake .
make MP
sudo make install
mkdir Tutorials
cd Tutorials
wget https://raw.githubusercontent.com/veg/hyphy-tutorials/master/docs/selection/data/files.zip
unzip files.zip
```
Download the ADH_IV files from the course website
```
mkdir ADH_IV
cd ADH_IV

wget https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/ADH_nucleotide_RELAX_alignment50Plus.label
```

1. This data is in nexus format. What are the three main kinds of information in this file?

2. Compare the tree at the bottom of the nexus file with the tree you built last class. What is different about this tree?

3. Launch HyPhy and run RELAX on the ADH_IV dataset. This will take several minutes to run.

4. Open the JSON file in HyPhy vision. Is there evidence of relaxed or intensified selection? How can you tell?

5. Download the MORC2 files:
```
mkdir MORC2 
cd MORC2
wget https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/MORC2_sim_muscleco_Name.fasta
https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/MORC2_species.nwk
```
6. Run aBSREL with the MORC2 codon alignment and tree of primates. What does this gene do? Is there evidence of positive selection on any branches?

7. Run FEL in HyPhy with the MORC2 codon alignment and tree of primates. Is there evidence of positive selection on any sites?


