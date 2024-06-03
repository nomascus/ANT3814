# Phylogénétique Moléculaire

## Télécharger des séquences nucléotidiques

Pour construire un arbre phylogénétique, nous devons commencer par télécharger des données. Il est important que les séquences nucléotidiques que nous utilisons proviennent de la même région du génome pour chaque espèce. Cela est nécessaire car nous voulons comparer comment les mêmes positions dans le génome varient entre un grand nombre d'espèces.

Commençons par aller sur GenBank, qui est une base de données de séquences d'ADN disponibles publiquement, gérée par les National Institutes of Health (NIH). Il existe de nombreuses bases de données différentes au sein du NCBI qui stockent des données moléculaires, mais nous allons travailler aujourd'hui avec des données nucléotidiques.

> https://www.ncbi.nlm.nih.gov/nucleotide/

Vous pouvez rechercher ici n'importe quel type de séquence nucléotidique que vous voulez, car elle est cataloguée à partir des soumissions faites par les scientifiques lorsqu'ils publient leurs articles. Commençons par chercher de l'ADN mitochondrial de primates. En tapant le nom de l'espèce (ou parfois le nom commun) suivi de "mitochondrion", nous obtiendrons une liste des séquences mitochondriales humaines disponibles. Il y en a beaucoup. Parfois, pour d'autres espèces moins étudiées, vous ne trouverez peut-être que des fragments de gènes ou quelques individus, mais des bases de données comme GenBank grandissent et deviennent plus complètes au fil du temps. Le fichier GenBank fournira beaucoup d'informations sur la séquence, en particulier sur les gènes présents dans chaque région du fichier nucléotidique. Aujourd'hui, nous voulons juste télécharger les séquences fasta, donc vous pouvez le faire en cliquant sur **send to**, puis **file**, puis en changeant le format à **fasta**.

Téléchargez le fichier des génomes mitochondriaux d'ici : 

https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/DNA/primate_mitogenomes.fasta

Jetons un coup d'œil au fichier avec la commande ```less```. Vous vous souvenez du format d'un fichier fasta ?

Il y a deux types de lignes : des en-têtes qui commencent par un caractère ```>``` et des lignes de séquences. Un fichier fasta avec plusieurs séquences peut être distingué par le motif des lignes, car chaque ligne qui commence par le symbole supérieur est une nouvelle séquence.

Regardons le fichier d'une manière qui rend les différences un peu plus claires en ouvrant le fichier avec un visualiseur d'alignement appelé ```AliView```.

```student@ant3814:~/PHYLO$ aliview ```

Ce que nous voyons ici, c'est chaque séquence sur une ligne. Les en-têtes sont à gauche et la séquence est à droite. Chaque type de nucléotide a une couleur différente : A est vert, T est rouge, C est bleu et G est gris.

Remarquez comment il semble y avoir un motif à certains endroits mais pas à d'autres. Les nucléotides dans les premières colonnes sont principalement alignés, mais il semble y avoir du désordre autour de la position 20. De plus, faisons défiler jusqu'à la fin des fichiers et voyons comment cela devient beaucoup plus désordonné. À la fin, nous pouvons également voir que toutes les séquences ne sont pas de la même longueur. Si nous voulons comparer les nucléotides à chaque position entre toutes les espèces, nous devons les aligner.

## Alignement des séquences

L'alignement des séquences est un processus complexe, et nous n'entrerons pas dans les détails ici. Cependant, l'idée de base est que les régions similaires de l'ADN peuvent être alignées sur toutes les séquences, car toutes les espèces partagent une histoire évolutive commune. Au fil du temps, les séquences d'ADN deviennent de plus en plus différentes entre deux espèces en raison de mutations, de dérives et de sélections. Lorsque nous alignons deux séquences qui ont divergé l'une de l'autre, elles ne s'aligneront bien sûr pas parfaitement. Certains nucléotides différeront en raison de mutations. Cependant, parfois, il y aura une insertion ou une suppression d'un ou plusieurs nucléotides dans la séquence d'une espèce, ce qui peut entraîner l'apparition d'un décalage dans la séquence. Pour compenser ces insertions et suppressions, nous devons introduire des lacunes dans l'alignement pour certaines espèces.

Alignons nos séquences avec un programme appelé **mafft**. mafft est très rapide et peut choisir automatiquement les options pour votre alignement. Enregistrez l'alignement sous primate_mitogenomes.aligned.fasta

```
student@ant3814:~/PHYLO$ mafft --auto primate_mitogenomes.fasta > primate_mitogenomes.aligned.fasta
```

Maintenant, regardons le fichier aligné dans AliView. Remarquez d'abord qu'il n'y a que deux espèces avec des séquences au début de l'alignement, l'homme et le chat. Les autres espèces ne peuvent pas être alignées ici et ont juste des lacunes signalées par des tirets. Cela est probablement dû au fait que les fichiers ont des longueurs légèrement différentes. Passons à la partie où l'alignement devient visible pour toutes les espèces, vers la position 976. Nous pouvons voir qu'il y a des régions très conservées, où la séquence ne varie pas beaucoup, comme les positions 1000 - 1020, mais dans d'autres zones, il y a beaucoup de variations, comme 1030 - 1040. Parfois, cela est dû au fait que la région de l'ADN fait partie d'un gène soumis à une pression de sélection pour ne pas changer. D'autres fois, cela pourrait être une région du génome qui est tout simplement difficile à aligner.

## Nettoyage de l'alignement

En général, les alignements avec beaucoup de lacunes posent des problèmes pour la construction des arbres phylogénétiques, nous devons donc nettoyer cet alignement en supprimant ces régions mal alignées. Choisir quelles régions supprimer est un processus difficile qui peut être accablant lors de la construction d'alignements multiples à partir de différentes régions génétiques. Heureusement, des programmes ont été développés pour automatiser ce processus. Nous pouvons utiliser un appelé **Gblocks**.

```
student@ant3814:~/PHYLO$ Gblocks primate_mitogenomes.aligned.fasta -t=d
```

L'option -t=d indique au programme que ce sont des séquences d'ADN. Le fichier d'alignement nettoyé est nommé primate_mitogenomes.aligned.fasta-gb mais renommez-le pour garder fasta à la fin

```
student@ant3814:~/PHYLO$ mv primate_mitogenomes.aligned.fasta-gb primate_mitogenomes.aligned.gb.fasta
```

Maintenant, regardons l'alignement nettoyé. Vous voyez comme ça a l'air mieux ? Nous avons éliminé toutes les régions mal alignées, et nous pouvons commencer à voir comment des motifs de relations pourraient être présents dans les données.

**Remarque** : Gblocks n'aime pas les noms d'en-tête trop longs. Si vous obtenez une erreur à ce sujet, assurez-vous de les raccourcir en modifiant les noms dans vi.

## Construction de l'arbre avec IQTREE

Il existe de nombreux programmes et méthodes pour construire des arbres phylogénétiques. Ceux-ci incluent le neighbor-joining, UPGMA, la vraisemblance maximale et les approches bayésiennes, entre autres. De nombreuses universités proposent un cours de biologie entier dédié à la phylogénétique moléculaire, mais notre objectif aujourd'hui est de construire un arbre à partir de nos données mitochondriales pour que vous puissiez comprendre les bases de ce processus. Nous allons utiliser un programme appelé IQTREE pour construire un arbre de vraisemblance maximale.

La première étape dans le processus de construction de l'arbre est d'identifier le **modèle de substitution** des nucléotides, qui est un modèle de la probabilité qu'un type de nucléotide (ou acide aminé) se transforme en un autre. Par exemple, quelle est la probabilité qu'une purine se transforme en une autre purine par opposition à une pyrimidine. Ces modèles filtrent la complexité du processus de mutation biologique en motifs plus simples qui peuvent être décrits et prédits en utilisant un petit nombre de paramètres. Les modèles de substitution tentent de prédire le taux de substitution pour les nucléotides à un site donné, ainsi que la distribution des substitutions sur l'ensemble de la séquence. C'est un processus très compliqué, mais heureusement, IQTREE l'automatise pour nous.

```
student@ant3814:~/PHYLO$ iqtree2 -s primate_mitogenomes.aligned.gb.fasta -m MFP
```

Nous pouvons voir à partir de la sortie que le modèle GTR+F+I+G4 convient le mieux aux données. Maintenant, utilisons cette information pour reconstruire l'arbre phylogénétique.

```
student@ant3814:~/PHYLO$ iqtree2 -s primate_mitogenomes.aligned.gb.fasta -m GTR+F+I+G4
```

Ouvrons le fichier de l'arbre et regardons-le dans ```figtree```.

```
student@ant3814:~/PHYLO$ figtree
```

Remarquez ici que l'arbre semble un peu étrange. C'est parce qu'il s'agit d'un arbre **non enraciné**. Cela signifie que nous n'avons pas assigné une des espèces comme groupe externe connu par rapport aux autres espèces. Par exemple, si nous avions un petit arbre avec des chimpanzés, des gorilles, des humains et des macaques, nous pourrions définir les macaques comme la racine de l'arbre, car nous savons qu'ils sont les plus éloignés. Nous pouvons faire la même chose ici dans notre arbre. Nous savons que les chats et les chiens sont tous deux des carnivores et plus éloignés des autres espèces dans notre arbre. Choisissons les carnivores comme racine, en cliquant sur la branche menant aux chats et aux chiens puis en cliquant sur **reroot**. Maintenant, l'arbre semble beaucoup plus logique !

Il y a encore une chose que nous devons faire. Nous avons trouvé les divisions entre les taxons avec notre arbre, mais nous ne savons pas à quel point ces divisions sont fiables. Devons-nous leur faire confiance ? Nous pouvons tester la fiabilité d'une phylogénie basée sur des séquences en utilisant un processus statistique appelé **bootstrapping**. Le bootstrapping remélange les données d'entrée plusieurs fois et tire aléatoirement différentes espèces pour créer un nouvel alignement remélangé, qu'IQTREE utilise ensuite pour construire un nouvel arbre. Ce processus est répété plusieurs fois jusqu'à ce que nous obtenions un score indiquant combien de fois chaque branche de notre arbre initial est trouvée dans les arbres bootstrap répliqués. Les valeurs bootstrap dans un arbre phylogénétique indiquent que sur 100, combien de fois la même branche est observée en répétant la génération d'un arbre phylogénétique sur un ensemble de données rééchantillonné. Lançons 1000 réplicats bootstrap.

```
student@ant3814:~/PHYLO$ iqtree2 -s primate_mitogenomes.aligned.gb.fasta -m MFP -B 1000 --undo
```

Ici, l'option --undo indique que nous voulons utiliser l'arbre précédent et simplement changer certaines options dans la commande. Maintenant, ouvrons le nouvel arbre dans figtree et visualisons les étiquettes bootstrap sur les branches.

Vous pouvez voir que la plupart des nœuds ont des scores bootstrap de 100. Cela signifie que dans les 1000 arbres répliqués, IQTREE a trouvé la même division. Par exemple, les humains sont toujours plus étroitement liés aux deux espèces de chimpanzés qu'aux gorilles. Cependant, IQTREE a eu un peu plus de difficulté à placer les lapins et les musaraignes. Il en est de même pour le singe hurleur et le singe-araignée. En général, la règle est que vous voulez avoir une valeur bootstrap d'au moins 95 pour faire confiance à la division.

Dans l'ensemble, c'est un arbre bien résolu, mais il n'est pas parfait. N'oubliez pas que nous utilisons seulement de l'ADN mitochondrial ici. Nous aurions probablement plus de confiance si nous utilisions de nombreuses régions géniques différentes en même temps. Cependant, c'est assez remarquable que nous puissions identifier correctement les relations phylogénétiques parmi les primates avec une si petite quantité d'informations !

***

**Problème 6 : Phylogénétique**

1) Téléchargez le [primate_mitogenomes.fasta](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/DNA/primate_mitogenomes.fasta). Utilisez bash pour imprimer les en-têtes de chaque espèce dans le fichier primate_mitogenomes.fasta.

2) Téléchargez les séquences nucléotidiques du gène MYH1 de 5 primates et d'un mammifère non primate (à utiliser comme groupe externe). Assurez-vous de les télécharger au format fasta.

3) Concaténez les 6 fichiers fasta en un seul fichier fasta.

4) Alignez vos séquences fasta avec mafft.

5) Ouvrez le fichier d'alignement dans mafft et trouvez une région conservée et une région variable. Prenez une capture d'écran de chaque région et collez-la ici.

6) Construisez un arbre de vraisemblance maximale avec IQTREE en utilisant 1000 bootstraps.

7) Ouvrez l'arbre dans figtree, réenracinez-le en utilisant le groupe externe, et ajoutez les valeurs bootstrap. Collez une capture d'écran de l'arbre ici.
