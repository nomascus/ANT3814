# Population Structure 

**Population genetic structure**: A significant difference in allele frequencies between/among subpopulations. If individuals in subpopulations reproduce randomly (panmixia), then allele frequencies in each subpopulation will not differ significantly. However, if reproduction is non-random, systematic differences in allele frequencies may develop over time.

Population genetic structure can develop as a result of physical or behavioral barriers to gene flow, including geographical barriers and assortative mating, which is the preferential mating based on similar phenotypes

One of the most common ways to identify population genetic structure is through the use of principal components analysis

**Principal Components Analysis**:  A statistical approach that reduces the complexity of large multivariate datasets to individual vectors that represent the most variance possible. The data are transformed onto a new coordinate system that allows for the identification of clustered points.


![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA1.png)
In this case, each point represents a different individual, and there is no clear pattern

![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA2.png)
Sometimes there is no clear pattern even when groups are included in the data

![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA3.png)
But sometimes there is a clear pattern in the data. Note here that the orange samples cluster together.

When we look at actual human SNP data (in this case from Europe), there is a clear association between geography and genetic ancestry.  

![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA_Novembre.png)
_Genes mirror geography within Europe. Novembre (2012) Nature_

The colors here represent the country of origin of the 1387 individuals who were sampled at 500000 SNPs. Remember that no geographic information was used to generate the position of the points in this PCA.  This pattern shows that genetic distance mirrors geographic distance. Individuals located closer to each other are more likely to mate and exchange alleles, so neighboring populations are more similar to each other.


## Constructing a PCA with SNP data using PLINK

Working with the human SNP data we just saw is a little too complex for today. Instead, to practice constructing a PCA, we will download some example data that comes from a dataset of Cichlid fish. The data include two species (_Pundamilia nyereri_ and _Pundamilia pundamilia_) that have been sampled from two locations (makobe and python)

We will using a program called PLINK to generate the PCA data and plot it in Rstudio

> Install PLINK

```
# Download Linux 64 version of plink from https://www.cog-genomics.org/plink/
# double click on plink_linux_x86_64_20231211.zip to unzip it
# open terminal
cp ~/plink/Downloads/plink_linux_x86_64_20231211/plink ~/LOGICIELS/bin

```

> Download vcf file
```
wget https://raw.githubusercontent.com/speciationgenomics/data/master/cichlid_subset.vcf.gz
```
### Removing sites with linkage disequilibrium

One of the major assumptions of PCA is that the data we use is independent - i.e. there are no spurious correlations among the measured variables. This is obviously not the case for most genomic data as allele frequencies are correlated due to physical linkage and linkage disequilibrium. So as a first step, we need to prune our dataset of variants that are in linkage.

First things first, we will make a directory called  `PCA`

```
# move to your home directory
cd ~
# make a PCA directory
mkdir PCA
# move into it
cd PCA
```
We will also simplify our code using some environmental variables. Primarily we set one for our filtered VCF.
```
VCF=~/vcf/cichlid_full_filtered_rename.vcf.gz
```

This will make it very easy for  `plink`  to read in our data. Next we run the linkage pruning. Run the command and we will breakdown what all the arguments mean.

```
# perform linkage pruning - i.e. identify prune sites
plink --vcf $VCF --double-id --allow-extra-chr \
--set-missing-var-ids @:# \
--indep-pairwise 50 10 0.1 --out cichlids
```

So for our plink command, we did the following:

-   `--vcf`  - specified the location of our VCF file.
-   `--double-id`  - told  `plink`  to duplicate the id of our samples (this is because plink typically expects a family and individual id - i.e. for pedigree data - this is not necessary for us.
-   `--allow-extra-chr`  - allow additional chromosomes beyond the human chromosome set. This is necessary as otherwise plink expects chromosomes 1-22 and the human X chromosome.
-   `--set-missing-var-ids`  - also necessary to set a variant ID for our SNPs. Human and model organisms often have annotated SNP names and so  `plink`  will look for these. We do not have them so instead we set ours to default to  `chromosome:position`  which can be achieved in  `plink`  by setting the option  `@:#\1\2`  -  [see here](https://www.cog-genomics.org/plink/1.9/data#set_missing_var_ids)  for more info.
-   `--indep-pairwise`  - finally we are actually on the command that performs our linkage pruning! The first argument,  `50`  denotes we have set a window of 50 Kb. The second argument,  `10`  is our window step size - meaning we move 10 bp each time we calculate linkage. Finally, we set an r2  threshold - i.e. the threshold of linkage we are willing to tolerate. Here we prune any variables that show an r2  of greater than 0.1.
-   `--out`  Produce the prefix for the output data.

As well as being versatile,  `plink`  is very fast. It will quickly produce a linkage analysis for all our data and write plenty of information to the screen. When complete, it will write out two files  `cichlids.prune.in`  and  `cichlids.prune.out`. The first of these is a list of sites which fell below our linkage threshold - i.e. those we should retain. The other file is the opposite of this. In the next step, we will produce a PCA from these linkage-pruned sites.


### Run a PCA

Next we rerun plink with a few additional arguments to get it to conduct a PCA. We will run the command and then break it down as it is running.

```
# prune and create pca
plink --vcf $VCF --double-id --allow-extra-chr --set-missing-var-ids @:# \
--extract cichlids.prune.in \
--make-bed --pca --out cichlids

```

This is very similar to our previous command. What did we do here?

-   `--extract`  - this just lets  `plink`  know we want to extract only these positions from our VCF - in other words, the analysis will only be conducted on these.
-   `--make-bed`  - this is necessary to write out some additional files for another type of population structure analysis - a model based approach with  `admixture`.
-   `--pca`  - fairly self explanatory, this tells  `plink`  to calculate a principal components analysis.

Once the command is run, we will see a series of new files. We will break these down too:

PCA output:

-   `cichlids.eigenval`  - the eigenvalues from our analysis
-   `cichlids.eigenvec`- the eigenvectors from our analysis

`plink`  binary output

-   `cichlids.bed`  - the cichlids bed file - this is a binary file necessary for admixture analysis. It is essentially the genotypes of the pruned dataset recoded as 1s and 0s.
-   `cichlids.bim`  - a map file (i.e. information file) of the variants contained in the bed file.
-   `cichlids.fam`  - a map file for the individuals contained in the bed file.

### Problem Set: Plotting the PCA output

Next we turn to R to plot the analysis we have produced! Please download the file from the course website and open it in Rstudio in your virtual machine.
