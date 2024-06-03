# Série de problèmes

> installez hyphy sur la machine virtuelle. Exécutez chaque commande une ligne à la fois !

```
git clone https://github.com/veg/hyphy.git
cd hyphy
cmake .
make MP
sudo make install
mkdir Tutorials
cd Tutorials
wget https://raw.githubusercontent.com/veg/hyphy-tutorials/master/docs/selection/data/files.zip
unzip files.zip
```
Téléchargez les fichiers ADH_IV à partir du site web du cours
```
mkdir ADH_IV
cd ADH_IV

wget https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/ADH_nucleotide_RELAX_alignment.label.50Plus.nex

```

1. Ces données sont au format nexus. Quelles sont les trois principales sortes d'informations dans ce fichier?

2. Comparez l'arbre au bas du fichier nexus avec l'arbre que vous avez construit au dernier cours. Qu'est-ce qui est différent dans cet arbre?

3. Lancez HyPhy et exécutez RELAX sur l'ensemble de données ADH_IV. Cela prendra plusieurs minutes.

4. Ouvrez le fichier JSON dans HyPhy vision. Y a-t-il des preuves de sélection relâchée ou intensifiée? Comment pouvez-vous le dire?

5. Téléchargez les fichiers MORC2:
```
mkdir MORC2 
cd MORC2
wget https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/MORC2_sim_muscleco_Name.fasta
https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/MORC2_species.nwk
```
6. Exécutez aBSREL avec l'alignement de codons MORC2 et l'arbre des primates. Que fait ce gène? Y a-t-il des preuves de sélection positive sur certaines branches?

7. Exécutez FEL dans HyPhy avec l'alignement de codons MORC2 et l'arbre des primates. Y a-t-il des preuves de sélection positive sur certains sites?
