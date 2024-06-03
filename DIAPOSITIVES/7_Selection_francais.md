## Tester la sélection naturelle avec les modèles de codons

Une manière d'identifier la sélection naturelle est de tester la quantité de mutations qui ont causé des changements d'acides aminés dans les gènes codant pour des protéines. Ces types de tests sont réalisés en comparant le ratio de changements non-synonymes à synonymes dans une ou plusieurs espèces avec le ratio dans d'autres espèces d'un arbre phylogénétique.

Rappelez-vous que chaque séquence protéique est composée d'acides aminés codés par des groupes de trois nucléotides, appelés codons. Par exemple :

AAA, AGG, TTC

code pour

Lysine (K), Arginine (R), Phénylalanine (F)

Mais si vous changez la séquence en

AA**G**, AGG, T**C**C

cela code pour

Lysine (K), Arginine (R), Sérine (S)

La première substitution AA**A** -> AA**G** n'a pas causé de changement d'acide aminé (Lysine dans les deux cas), et est donc appelée une substitution **synonyme**. En général, ces substitutions n'ont aucun effet sur la protéine.

La deuxième substitution TT**C** -> TC**C** a causé un changement d'acide aminé (Phénylalanine en Sérine), et est donc appelée une substitution **non-synonyme**. Ces substitutions peuvent avoir un effet majeur sur la protéine.

Le ratio de substitutions synonymes à non-synonymes dans un gène est appelé le **ratio dN/dS**.
Quand le ratio **dN/dS**.

dN/dS | Sélection | Interprétation
--- | --- | ---
dN/dS < 1 | Négative (purificatrice) | Les mutations nocives sont éliminées, gardant la séquence d'ADN conservée
dN/dS > 1 | Positive (diversifiante) | Des mutations bénéfiques sont survenues et sont maintenues
dN/dS ~ 1 | Aucune (neutre) | Les mutations ont peu d'effet et bien que la séquence d'ADN change, cela a peu d'effet sur l'espèce

### Tester la sélection avec aBSREL et RELAX

Il existe de nombreux programmes qui utilisent les ratios dN/dS pour tester la sélection dans une espèce par rapport à d'autres espèces étroitement apparentées. Le programme le plus largement utilisé s'appelle PAML, mais il n'est pas très convivial. Nous allons utiliser un package appelé HyPhy qui comprend de nombreux programmes pour l'analyse de la sélection naturelle. Chacun de ces programmes teste la sélection de manière légèrement différente. Par exemple, certains d'entre eux recherchent des preuves de sélection sur une branche unique d'une phylogénie. Cela pourrait être une espèce individuelle (par exemple, les humains) ou la branche ancestrale qui conduit à plusieurs espèces (par exemple, la branche conduisant aux humains, chimpanzés et bonobos).

aBSREL (**a**daptive **B**ranch-**S**ite **R**andom **E**ffects **L**ikelihood) teste si une sélection positive s'est produite sur une proportion de branches. aBSREL testera, pour chaque branche (ou branche d'intérêt) de la phylogénie, si une proportion de sites ont évolué sous sélection positive en utilisant un test de rapport de vraisemblance.

Nous pouvons exécuter aBSREL dans le package HyPhy,

```
hyphy absrel ADH_nucleotide_RELAX_alignment.nex
```

Dans ce cas, nous recherchons des valeurs dN/dS significativement >1 sur chaque branche de l'arbre phylogénétique pour le gène ADH7. Ce gène est impliqué dans le métabolisme de l'alcool. Les grands singes sont connus pour avoir une substitution qui augmente la capacité à métaboliser l'alcool, ce qui nous donne une tolérance plus élevée. Les fruits en décomposition fermentent, et de nombreux animaux ont été observés en train de les manger et semblent devenir ivres.

Les résultats de aBSREL sont enregistrés dans un fichier JSON qui peut être ouvert en ligne dans [hyphy vision](vision.hyphy.org). La seule branche avec une preuve significative de sélection positive (p < 0,05) est la branche menant aux éléphants (nœud 140).

```
wget https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/RELAX/ADH_nucleotide_RELAX_alignment.label.nex
```

RELAX est un programme HyPhy qui utilise un cadre de test d'hypothèse pour déterminer si la force de la sélection naturelle a été relâchée ou intensifiée le long d'un ensemble spécifié de branches de test. RELAX n'est donc pas une méthode appropriée pour tester explicitement la sélection positive. Au lieu de cela, RELAX est le plus utile pour identifier des tendances et/ou des changements dans la rigueur de la sélection naturelle sur un gène donné.

RELAX nécessite un ensemble spécifié de branches de "test" à comparer avec un deuxième ensemble de branches de "référence". RELAX teste ensuite le relâchement/intensification de la sélection en introduisant le paramètre **k** (où k≥0), servant de **paramètre d'intensité de la sélection**. RELAX effectue ensuite un test de rapport de vraisemblance pour comparer les modèles alternatifs et nuls. Un résultat significatif de **k>1 indique que la force de la sélection a été intensifiée** le long des branches de test, et un résultat significatif de **k<1 indique que la force de la sélection a été relâchée** le long des branches de test.

RELAX nécessite un ensemble de données avec un alignement de codons et un arbre phylogénétique qui étiquette les espèces appartenant à différents groupes d'intérêt.

```
hyphy relax --alignment ADH_nucleotide_RELAX_alignment.label.50Plus.nex --test FRUIT-NECTAR --reference OTHERDIETS
```

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
