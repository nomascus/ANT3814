# Structure de la Population

**Structure génétique des populations** : Une différence significative dans les fréquences des allèles entre/entre les sous-populations. Si les individus des sous-populations se reproduisent au hasard (panmixie), alors les fréquences des allèles dans chaque sous-population ne différeront pas significativement. Cependant, si la reproduction n'est pas aléatoire, des différences systématiques dans les fréquences des allèles peuvent se développer avec le temps.

La structure génétique des populations peut se développer à la suite de barrières physiques ou comportementales au flux de gènes, y compris les barrières géographiques et l'accouplement assortatif, qui est l'accouplement préférentiel basé sur des phénotypes similaires.

L'une des méthodes les plus courantes pour identifier la structure génétique des populations est l'utilisation de l'analyse en composantes principales.

**Analyse en Composantes Principales (PCA)** : Une approche statistique qui réduit la complexité des grands ensembles de données multivariées en vecteurs individuels qui représentent la plus grande variance possible. Les données sont transformées sur un nouveau système de coordonnées qui permet l'identification de points regroupés.

![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA1.png)
Dans ce cas, chaque point représente un individu différent, et il n'y a pas de motif clair.

![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA2.png)
Parfois, il n'y a pas de motif clair même lorsque des groupes sont inclus dans les données.

![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA3.png)
Mais parfois, il y a un motif clair dans les données. Notez ici que les échantillons orange se regroupent.

Lorsque nous examinons les données SNP humaines réelles (dans ce cas en provenance d'Europe), il y a une association claire entre la géographie et l'ascendance génétique.

![enter image description here](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/PCA/PCA_Novembre.png)
_Genes mirror geography within Europe. Novembre (2012) Nature_

Les couleurs ici représentent le pays d'origine des 1387 individus qui ont été échantillonnés sur 500000 SNPs. Rappelez-vous qu'aucune information géographique n'a été utilisée pour générer la position des points dans cette ACP. Ce motif montre que la distance génétique reflète la distance géographique. Les individus situés plus près les uns des autres sont plus susceptibles de se reproduire et d'échanger des allèles, de sorte que les populations voisines sont plus similaires les unes aux autres.

## Construction d'une PCA avec des données SNP en utilisant PLINK

Travailler avec les données SNP humaines que nous venons de voir est un peu trop complexe pour aujourd'hui. À la place, pour pratiquer la construction d'une ACP, nous allons télécharger des données d'exemple provenant d'un ensemble de données de poissons Cichlidés. Les données incluent deux espèces (_Pundamilia nyereri_ et _Pundamilia pundamilia_) qui ont été échantillonnées de deux endroits (makobe et python).

Nous utiliserons un programme appelé PLINK pour générer les données ACP et les tracer dans Rstudio.

> Installer PLINK

```
# Télécharger la version Linux 64 de plink depuis https://www.cog-genomics.org/plink/
# double-cliquez sur plink_linux_x86_64_20231211.zip pour le décompresser
# ouvrez le terminal
cp ~/plink/Downloads/plink_linux_x86_64_20231211/plink ~/LOGICIELS/bin

```

> Télécharger le fichier vcf
```
wget https://raw.githubusercontent.com/speciationgenomics/data/master/cichlid_subset.vcf.gz
```
### Suppression des sites en déséquilibre de liaison

L'une des principales hypothèses de l'PCA est que les données que nous utilisons sont indépendantes - c'est-à-dire qu'il n'y a pas de corrélations spurious entre les variables mesurées. Cela n'est évidemment pas le cas pour la plupart des données génomiques car les fréquences des allèles sont corrélées en raison de la liaison physique et du déséquilibre de liaison. Donc, comme première étape, nous devons épurer notre ensemble de données des variants en liaison.

Tout d'abord, nous allons créer un répertoire appelé `PCA`.

```
# aller dans votre répertoire principal
cd ~
# créer un répertoire PCA
mkdir PCA
# y entrer
cd PCA
```
Nous allons également simplifier notre code en utilisant quelques variables environnementales. Principalement, nous en définissons une pour notre VCF filtré.
```
VCF=~/vcf/cichlid_full_filtered_rename.vcf.gz
```

Cela facilitera la lecture de nos données par `plink`. Ensuite, nous exécutons l'épuration de la liaison. Exécutez la commande et nous expliquerons ce que signifient tous les arguments.

```
# effectuer l'épuration de la liaison - c'est-à-dire identifier les sites à épurer
plink --vcf $VCF --double-id --allow-extra-chr \
--set-missing-var-ids @:# \
--indep-pairwise 50 10 0.1 --out cichlids
```

Donc, pour notre commande plink, nous avons fait ce qui suit :

-   `--vcf`  - spécifié l'emplacement de notre fichier VCF.
-   `--double-id`  - dit à `plink` de dupliquer l'id de nos échantillons (cela est dû au fait que plink attend généralement un id de famille et un id individuel - c'est-à-dire pour les données de pedigree - cela n'est pas nécessaire pour nous).
-   `--allow-extra-chr`  - permet des chromosomes supplémentaires au-delà de l'ensemble des chromosomes humains. Cela est nécessaire sinon plink s'attend aux chromosomes 1-22 et au chromosome X humain.
-   `--set-missing-var-ids`  - également nécessaire pour définir un identifiant de variant pour nos SNPs. Les humains et les organismes modèles ont souvent des noms de SNP annotés, donc `plink` les cherchera. Nous ne les avons pas, donc nous définissons les nôtres par défaut à `chromosome:position`, ce qui peut être réalisé dans `plink` en définissant l'option `@:#\1\2` -  [voir ici](https://www.cog-genomics.org/plink/1.9/data#set_missing_var_ids) pour plus d'infos.
-   `--indep-pairwise`  - enfin, nous sommes réellement sur la commande qui effectue notre épuration de la liaison! Le premier argument, `50`, indique que nous avons défini une fenêtre de 50 Kb. Le deuxième argument, `10`, est notre taille de pas de fenêtre - ce qui signifie que nous nous déplaçons de 10 pb chaque fois que nous calculons la liaison. Enfin, nous définissons un seuil de r2 - c'est-à-dire le seuil de liaison que nous sommes prêts à tolérer. Ici, nous épurons toutes les variables qui montrent un r2 supérieur à 0,1.
-   `--out`  Produit le préfixe pour les données de sortie.

En plus d'être polyvalent, `plink` est très rapide. Il produira rapidement une analyse de la liaison pour toutes nos données et écrira beaucoup d'informations à l'écran. Une fois terminé, il écrira deux fichiers `cichlids.prune.in` et `cichlids.prune.out`. Le premier de ces fichiers est une liste de sites qui sont inférieurs à notre seuil de liaison - c'est-à-dire ceux que nous devons conserver. L'autre fichier est l'opposé de cela. Dans l'étape suivante, nous produirons une ACP à partir de ces sites épurés de la liaison.

### Exécuter une PCA

Ensuite, nous relançons plink avec quelques arguments supplémentaires pour lui faire réaliser une PCA. Nous exécuterons la commande et ensuite l'expliquerons pendant qu'elle fonctionne.

```
# épurer et créer une PCA
plink --vcf $VCF --double-id --allow-extra-chr --set-missing-var-ids @:# \
--extract cichlids.prune.in \
--make-bed --pca --out cichlids

```

C'est très similaire à notre commande précédente. Qu'avons-nous fait ici?

-   `--extract`  - cela permet simplement à `plink` de savoir que nous voulons extraire uniquement ces positions de notre VCF - en d'autres termes, l'analyse ne sera effectuée que sur celles-ci.
-   `--make-bed`  - c'est nécessaire pour écrire des fichiers supplémentaires pour un autre type d'analyse de structure de la population - une approche basée sur un modèle avec `admixture`.
-   `--pca`  - assez explicite, cela indique à `plink` de calculer une analyse en composantes principales.

Une fois la commande exécutée, nous verrons une série de nouveaux fichiers. Nous les expliquerons également :

Sortie de l'PCA :

-   `cichlids.eigenval`  - les valeurs propres de notre analyse.
-   `cichlids.eigenvec` - les vecteurs propres de notre analyse.

Sortie binaire de `plink` :

-   `cichlids.bed`  - le fichier bed des cichlidés - c'est un fichier binaire nécessaire pour l'analyse de l'admixture. Il s'agit essentiellement des génotypes de l'ensemble de données épuré codés en 1 et 0.
-   `cichlids.bim`  - un fichier de carte (c'est-à-dire un fichier d'informations) des variants contenus dans

 le fichier bed.
-   `cichlids.fam`  - un fichier de carte pour les individus contenus dans le fichier bed.

### Ensemble de Problèmes : Tracer la sortie de l'PCA

Ensuite, nous nous tournons vers R pour tracer l'analyse que nous avons produite! Veuillez télécharger le [fichier](https://raw.githubusercontent.com/nomascus/ANT3814/main/PROBLEM_SETS/9_problemSet_PCA_francais.rmd) depuis le site web du cours et l'ouvrir dans Rstudio sur votre machine virtuelle.
