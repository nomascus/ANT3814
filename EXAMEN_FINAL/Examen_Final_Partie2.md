# ANT3814 Examen final partie 2: Bioinformatique

1) Comment une valeur de dN / dS peut-elle être utilisée pour détecter la sélection naturelle dans un gène codant pour une protéine?

2) Quel module de HyPhy avons-nous utilisé pour détecter la sélection positive dans des gènes entiers codant pour des protéines (pas des sites d'acides aminés uniques)? 

A) absrel 
B) busted 
C) fel 
D) slac

3) Décrivez comment la méthode RELAX dans HyPhy peut être utilisée pour détecter une pression de sélection relâchée ou intensifiée sur un ensemble de branches dans un arbre phylogénétique.

4) Décrivez les étapes de base pour exécuter la méthode RELAX en ligne de commande dans HyPhy, y compris les fichiers d'entrée nécessaires et les paramètres optionnels que nous avons spécifiés.

5) Quel est le nom du référentiel de données en ligne que nous avons utilisé pour télécharger des données de séquences d'ADN?

6) Quelle est la fonction de MAFFT en phylogénétique? 

A) Alignement de séquences multiples 
B) Inférence d'arbres 
C) Visualisation d'arbres phylogénétiques 
D) Estimation de l'horloge moléculaire

7) Décrivez les principales étapes impliquées dans l'utilisation de MAFFT pour aligner un ensemble de séquences d'ADN.

8) Quels types de fichiers sont utilisés pour exécuter MAFFT?

9) Décrivez les étapes de base pour exécuter la méthode iqtree en ligne de commande, y compris les fichiers d'entrée nécessaires et les paramètres optionnels que nous avons spécifiés.

10) Expliquez comment interpréter les valeurs de bootstrap produites par IQ-TREE dans un arbre phylogénétique.

11) Décrivez les principales étapes à la ligne de commande R impliquées dans l'utilisation de admixR pour identifier l'introgression dans les données génomiques.

12) Comment fonctionne un test ABBA BABA?

13) Expliquez comment admixR fait la distinction entre l'introgression et le tri de lignées incomplet dans les analyses phylogénétiques.

14) Comment déterminez-vous que la valeur d'une statistique D est significative dans admixR?

15) Quelle est la différence entre une statistique D positive et négative?

16) Quel est le but principal de l'utilisation de l'ACP en génétique des populations? 

A) Inférer les relations phylogénétiques entre les populations 
B) Détecter la sélection naturelle agissant sur des gènes spécifiques 
C) Visualiser la variation génétique et la structure de la population 
D) Estimer les temps de divergence entre les populations

17) Décrivez les étapes générales impliquées dans l'exécution d'une analyse PCA en utilisant PLINK à la ligne de commande.

18) Dans un graphique PCA généré par PLINK, chaque point représente: 

A) Un individu 
B) Un SNP 
C) Une population 
D) Un marqueur génétique

19) Dans un graphique PCA, quel axe représente la plupart de la variance dans les données SNP?

20) Dans la ligne de code suivante, que fait l'option --allow-extra-chr? 

plink --vcf $VCF --double-id --allow-extra-chr --set-missing-var-ids @:# --extract cichlids.prune.in --make-bed --pca --out cichlids

21) Qu'est-ce qu'une variante de séquence amplicon (ASV)?

22) Qu'est-ce que la diversité alpha dans le contexte d'une analyse de microbiome?

23) Qu'est-ce que la diversité bêta dans le contexte d'une analyse de microbiome?

24) Décrivez le concept de rarefaction dans l'analyse de microbiome et expliquez pourquoi elle est utilisée.

25) Lequel des éléments suivants est une mesure couramment utilisée pour calculer la diversité alpha? 

A) Dissimilarité de Bray-Curtis 
B) Indice de Jaccard 
C) Indice de diversité de Shannon 
D) Distance UniFrac