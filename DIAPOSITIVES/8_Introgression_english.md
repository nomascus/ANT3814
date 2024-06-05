# Introgression

## Gene flow, hybridization, admixture, & introgression


**Species tree**: A phylogenetic tree that shows the overall pattern of how species share a common ancestral population history

**Gene tree**: Individual genes (and their alleles) may have a different history within species as they separate from one another. We can examine the phylogenies of individual genes, which are called “gene trees.”

**Incomplete lineage sorting**: When a genetic polymorphism does not coalesce within a single species. It coalesces in the common ancestor of multiple species.

**Gene Flow**: When individuals migrate from one population to another, they can introduce new or low frequency alleles to the secondary population. This can change the allele frequency of the secondary population
  
**Genetic admixture**: previously isolated populations (or species) interbreed (hybridize) resulting in a genetic mixture of the two original populations

**Genomic introgression**: incorporation of alleles from one population (or species) into the gene pool of a second divergent population

These are very similar concepts. Generally, hybridization, admixture, and introgression refer to gene flow between species or more distantly related populations.  

[ABBA BABA Slides](https://github.com/nomascus/ANT3814/blob/main/DIAPOSITIVES/ABBA-BABA_Francais.pdf)


## D statistic 

NOTE: this section is modified from the admixr tutorial (https://bodkan.net/admixr/articles/01-tutorial.html)

Let’s say we are interested in the following question:  _“Which human populations today show evidence of Neanderthal admixture?_

For example, if we want to test whether some modern humans from Europe admixed with Neanderthals, which would increase their genetic affinity to this archaic group compared to modern humans from African (whose ancestors never met Neanderthals), we would need a group of three populations/species and an outgroup: 

( French, Yoruba, Neanderthal, Chimpanzee )

We can call these four groups populations W, X, Y, and Z

One way of looking at this is using the following D statistic:

<u># BABA sites - # ABBA sites</u>
\# BABA sites + # ABBA sites

𝐷  statistics are based on comparing the proportions of BABA and ABBA sites patterns observed in the data. A significant departure of  𝐷  from zero indicates an excess of allele sharing between the first and the third population (positive  𝐷), or an excess of allele sharing between the second and the third population (negative  𝐷). If we get  𝐷  that is not significantly different from 0, this suggests that the first and second populations form a clade, and don’t differ in the rate of allele sharing with the third population (this is the null hypothesis that the data is compared against).

## Install AdmixTools and admixr

>Install AdmixTools 
```
cd LOGICIELS
git clone https://github.com/DReichLab/AdmixTools.git
cd AdmixTools
sudo apt-get install libopenblas-dev
cd SRC
make clobber; make all; make install
echo "export PATH=\"$PATH:/home/student/LOGICIELS/AdmixTools/bin\"" >> ~/.bashrc

cp /etc/R/Renviron ~/.Renviron
echo $PATH >> ~/.Renviron

cd ~
mkdir ~/INTROGRESSION; cd ~/INTROGRESSION
wget --no-check-certificate https://bioinf.eva.mpg.de/admixr/snps.tar.gz
tar -xvf snps.tar.gz
```

# Problem Set
Download the [problem set](https://raw.githubusercontent.com/nomascus/ANT3814/main/PROBLEM_SETS/Introgression_problemSet_francais.rmd) : and open it R studio
