# Introgression

## Flux génétique, hybridation, mélange génétique et introgression


**Arbre phylogénétique des espèces** : Un arbre phylogénétique qui montre le schéma général de la façon dont les espèces partagent une histoire de population ancestrale commune.

**Arbre génétique** : Les gènes individuels (et leurs allèles) peuvent avoir une histoire différente au sein des espèces à mesure qu'elles se séparent les unes des autres. Nous pouvons examiner les phylogénies des gènes individuels, que l'on appelle « arbres génétiques ».

**Tri incomplet des lignées** : Lorsque le polymorphisme génétique ne se regroupe pas au sein d'une seule espèce. Il se regroupe dans l'ancêtre commun de plusieurs espèces.

**Flux génétique** : Lorsque des individus migrent d'une population à une autre, ils peuvent introduire des allèles nouveaux ou de faible fréquence dans la population secondaire. Cela peut changer la fréquence des allèles de la population secondaire.

**Mélange génétique** : Des populations (ou espèces) précédemment isolées se croisent (s'hybrident) ce qui entraîne un mélange génétique des deux populations d'origine.

**Introgression génomique** : Incorporation d'allèles d'une population (ou espèce) dans le pool génétique d'une deuxième population divergente.

Ce sont des concepts très similaires. Généralement, l'hybridation, le mélange génétique et l'introgression font référence au flux génétique entre espèces ou des populations plus éloignées.

[Diapositives ABBA BABA](https://github.com/nomascus/ANT3814/blob/main/DIAPOSITIVES/ABBA-BABA_Francais.pdf)

## Statistique D

REMARQUE : cette section est modifiée à partir du tutoriel admixr (https://bodkan.net/admixr/articles/01-tutorial.html)

Supposons que nous soyons intéressés par la question suivante : _« Quelles populations humaines aujourd'hui montrent des preuves de mélange avec les Néandertaliens ? »_

Par exemple, si nous voulons tester si certains humains modernes d'Europe se sont mélangés avec des Néandertaliens, ce qui augmenterait leur affinité génétique avec ce groupe archaïque par rapport aux humains modernes d'Afrique (dont les ancêtres n'ont jamais rencontré les Néandertaliens), nous aurions besoin d'un groupe de trois populations/espèces et d'un groupe externe : 

(Français, Yoruba, Néandertalien, Chimpanzé)

Nous pouvons appeler ces quatre groupes les populations W, X, Y et Z.

Une façon de voir cela est d'utiliser la statistique D suivante :

<u># Sites BABA - # Sites ABBA</u>
\# Sites BABA + # Sites ABBA

Les statistiques 𝐷 sont basées sur la comparaison des proportions de motifs de sites BABA et ABBA observés dans les données. Un écart significatif de  𝐷 par rapport à zéro indique un excès de partage d'allèles entre la première et la troisième population (𝐷 positif), ou un excès de partage d'allèles entre la deuxième et la troisième population (𝐷 négatif). Si nous obtenons  𝐷 qui n'est pas significativement différent de 0, cela suggère que les première et deuxième populations forment un clade et ne diffèrent pas dans le taux de partage d'allèles avec la troisième population (c'est l'hypothèse nulle contre laquelle les données sont comparées).

## Installer AdmixTools et admixr

>Installer AdmixTools 
```
cd LOGICIELS
git clone https://github.com/DReichLab/AdmixTools.git
cd AdmixTools
sudo apt-get install libopenblas-dev
cd SRC
make clobber; make all; make install
cp /etc/R/Renviron ~/.Renviron
echo "PATH=/home/student/LOGICIELS/ADMIXTOOLS/bin" >> ~/.Renviron

cd ~
mkdir ~/INTROGRESSION; cd ~/INTROGRESSION
wget --no--check-certificate https://bioinf.eva.mppg.de/admixr/snps.tar.gz
tar -xvf snps.tar.gz
```

# Problème à résoudre
Téléchargez le [problème à résoudre](https://raw.githubusercontent.com/nomascus/ANT3814/main/PROBLEM_SETS/Introgression_problemSet_francais.rmd) : et ouvrez-le dans R studio
