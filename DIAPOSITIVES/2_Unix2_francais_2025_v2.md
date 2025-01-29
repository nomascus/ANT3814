# ANT3814: Seminar d'anthropologie -  Computational Methods in Molecular Anthropology



## Cours 2:  Variables Bash, awk et sed


#### Pour accéder à la leçon d'aujourd'hui, téléchargez le fichier html appelé 2_Unix2_francais_2025_v2.html depuis studium. Il devrait s'ouvrir avec votre navigateur web.

Commençons par créer un nouveau dossier dans votre cluster pour la leçon de cette semaine. Après vous être connecté, nous commencerons par votre dossier personnel. Descendez ensuite d'un répertoire jusqu'au dossier projects, d'un deuxième répertoire jusqu'au répertoire def-sponsor00, puis d'un troisième répertoire jusqu'au dossier contenant votre USERID (remplacez USERID par votre USERID, quel qu'il soit). Créez ensuite un nouveau dossier appelé 2_Unix2, et déplacez-vous dans ce dossier.

```
cd ~/projects/def-sponsor00/USERID
mkdir 2_Unix2 
cd 2_Unix2
```
Après avoir fait cela, téléchargez les fichiers suivants pour cette leçon en copiant, collant et exécutant chaque ligne de ce code.

```
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/FILES/sample.vcf
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/FILES/file1.txt
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/FILES/file2.txt
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/FILES/file3.txt
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/FILES/file4.txt
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/PROBLEM_SETS/Unix2_problemSet_English.md
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/PROBLEM_SETS/Unix2_problemSet_Francais.md
wget https://raw.githubusercontent.com/nomascus/ANT3814/refs/heads/main/DIAPOSITIVES/2_Unix2_francais_2025.md
```


## Variables Bash

Jusqu'à présent, nous n'avons travaillé qu'avec des fichiers et des répertoires ayant des noms fixes. Par exemple, big_file.fasta et ~/home/orkin/scratch/FILES sont des noms que nous avons définis dans l'ordinateur. Nous pouvons changer ces noms en utilisant mv ou cp, mais parce que nous les avons codés pour avoir un nom fixe, bash ne les considère pas comme des variables. Bien sûr, bash a la capacité de créer des variables, et nous les utiliserons beaucoup ! Les langages de programmation peuvent stocker des informations de différentes manières, et nous appelons cela **structures de données**. Pour la plupart dans ce cours, nous allons travailler avec des **variables scalaires**, que j'appellerai généralement **scalaires** pour raccourcir le nom. Pensez à un scalaire comme à n'importe quel élément d'information que vous voulez stocker dans une variable. Cela pourrait être un nombre, un mot, une phrase, mille lignes de texte ou toute combinaison de caractères.

### Enregistrer des variables
```
myName='Joe'

band='Les Cowboys Fringants'

geneSequence='GATTACA'

fastaHeader='>HM757933.1|Pan paniscus isolate PPN-8 SRY'

fastaSequence='AGAGTGAAGCGACCCATGAACGCATTCTTCGTGTGGTCTCGCGATCAGAGGCGCAAGATGGCTCTAGAGAATCC'

daysLeft=9

```
Ce sont toutes des variables scalaires, car ce sont des éléments d'information uniques. Notez quelques points ici.

1) Lorsque vous enregistrez une variable scalaire en bash, vous créez une équation. Vous écrivez le nom de la variable à gauche du signe égal et placez les données que vous voulez enregistrer à l'intérieur de la variable à droite.  

2) Ne mettez aucun espace dans le nom de la variable ni entre le nom de la variable et les données à stocker dans la variable. Cela provoquera un message d'erreur, car bash sépare les éléments d'information avec des espaces.

```
[orkin@login1 2_Unix2]$ myName='Joe'
[orkin@login1 2_Unix2]$ my Name='Joe'
my: command not found
[orkin@login1 2_Unix2]$ myName = 'Joe'
myName: command not found
```

3) Lorsque vous nommez vos variables, commencez par une lettre minuscule. Pour de nombreux langages de programmation, les variables nommées avec des lettres majuscules ont un sens spécial. Si le nom de votre variable est composé de plusieurs mots, essayez de commencer chaque nouveau mot par une lettre majuscule (cela s'appelle "camel case"). Par exemple, une variable nommée monGroupePrefere est beaucoup plus lisible qu'une variable nommée mongroupepréféré.

4) Si vous stockez du texte dans une variable, qu'il s'agisse d'un mot ou de plusieurs mots, vous devez mettre le texte entre guillemets. Sinon, bash pensera que chaque mot séparé par un espace est un nouvel élément d'information.

5) Si vous enregistrez un nombre dans une variable, n'utilisez pas de guillemets. Dans l'exemple ci-dessus, bash reconnaîtra la variable daysLeft comme un nombre et vous permettra d'effectuer des opérations mathématiques avec elle. Cependant, si vous avez enregistré la variable comme ceci :  ```daysLeft='9'```, alors bash pensera que c'est du texte, pas un nombre, et la variable ne fonctionnera que dans les programmes qui fonctionnent sur du texte. 

C'est le moment idéal pour mentionner comment les variables scalaires peuvent être classées en bash. 

**Chaînes de caractères (strings)** : séquences de caractères, entre guillemets simples (' ') ou doubles (" "). Les chaînes de caractères sont utilisées pour stocker des données textuelles. Exemple : `myName="Joe"`.   Si vous avez un mélange de chiffres et de lettres dans votre variable, Bash la considérera toujours comme une chaîne de caractères. Par exemple, ```fastaHeader='>Pan panascus|AMY1|AN234.2456.A'``` est toujours une seule chaîne de caractères enregistrée dans une variable scalaire. 

**Entiers (integers)** : Bash peut gérer l'arithmétique entière, mais contrairement à d'autres langages de programmation, techniquement Bash n'a pas de type de données entier distinct. Cependant, les variables contenant des entiers sont traitées comme des chaînes de caractères sauf indication contraire. Exemple : `daysLeft=9`

**Nombres à virgule flottante (floating point numbers)** : les nombres non entiers (c'est-à-dire ceux avec des décimales et des chiffres significatifs) sont généralement appelés nombres à virgule flottante ou floats dans d'autres langages. En Bash, l'arithmétique en virgule flottante n'est pas prise en charge nativement. Les opérations arithmétiques sont généralement limitées à l'arithmétique entière. Cependant, vous pouvez effectuer des opérations en virgule flottante en utilisant des outils ou des commandes externes, tels que `awk`, `bc` ou `printf`, dont nous parlerons plus tard.

6) Il est important de choisir un nom approprié pour votre variable. "Choisir de bons noms de variables pour les objets que vous nommez vous-même est très important. Ne nommez pas vos variables des choses comme  `items`  ou  `my_list`  ou  `data`  ou  `var`. Sauf pour un code très simple, ou si vous tracez un graphique, ne nommez pas vos objets  `x`  ou  `y`  non plus. Tous ces exemples de noms ne sont pas descriptifs de quel type de données vous trouverez dans la variable ou l'objet. Pire encore est de nommer une variable qui contient des noms de gènes comme  `sequences`. Pourquoi est-ce une si mauvaise idée ? Pensez à ce qui se passerait si vous remplissiez votre voiture dans un magasin étiqueté 'station-service' qui vendait du limonade. En informatique, les noms doivent toujours décrire avec précision l'objet auquel ils sont attachés. Cela réduit la possibilité de bugs dans votre code, le rend beaucoup plus facile à comprendre si vous y revenez après six mois ou si vous partagez votre code avec quelqu'un, et permet d'écrire plus rapidement du code qui fonctionne correctement. Même si cela prend un peu de temps et d'efforts pour trouver un bon nom pour un objet, cela évitera tellement de problèmes à l'avenir !" - [PFB 2023](https://github.com/prog4biol/pfb2023/blob/master/pfb.md/#python-1)“

#### Variables d'environnement

Lorsque vous nommez des variables en bash, assurez-vous de ne pas écraser accidentellement les variables système internes, appelées variables d'environnement. Beaucoup d'entre elles sont stockées en lettres majuscules. Par exemple, le nom de l'utilisateur actuel et de l'ordinateur est stocké dans ```$USER``` et ```$HOSTNAME```. 

```
[orkin@login1 2_Unix2]$ echo $USER
orkin
[orkin@login1 2_Unix2]$ echo $HOSTNAME
login1.int.ant3814.calculquebec.cloud
```
Le prompt de commande a-t-il plus de sens maintenant ? Une autre façon d'écrire cela serait : ```[$USER```@```$HOSTNAME``` ```$PWD ```]$

Cependant, sur notre serveur et pour ceux d'entre nous qui utilisent leur propre ordinateur Mac OSX ou Linux, nous verrons quelque chose de différent. Imaginez comment un grand serveur informatique peut avoir des centaines d'utilisateurs différents, mais il doit s'assurer que chaque utilisateur est envoyé vers le répertoire personnel correct. Lorsque vous vous connectez, le serveur vous attribuera une variable spéciale $USER afin que lorsque vous tapez ```cd ~``` vous soyez envoyé vers le répertoire correct. 

De plus, n'utilisez aucune variable qui soit un nombre, comme ```$0``` ou  ```$1```, ou ```$37```. Ces variables ont une signification spéciale en ce qui concerne la manière dont les informations sont transmises à un script (programme). Disons que nous avons un programme qui nécessite deux informations pour fonctionner. Par exemple, un nom d'espèce et un fichier contenant une liste d'identifiants d'espèces.

```
[orkin@login1 2_Unix2]$ speciesfinder.py Homo_sapiens speciesList.txt 
```

bash interprète une série de chaînes sur la ligne de commande comme une liste ordonnée et les enregistre sous forme de variables numériques commençant par zéro. Dans ce cas, nous avons ```$0```, ```$1```, et  ```$2```. $0 est le script en cours d'exécution, $1 est la chaîne Homo_sapiens, et $2 est le fichier speciesList.txt. 

Quelles seraient les variables si nous écrivions :
 ```
[orkin@login1 2_Unix2]$ speciesfinder.py Homo_sapiens
```

Rappelez-vous que les espaces sont importants en Unix. Chaque variable est séparée par un espace.

_Remarque_ : Dans ce cas, le script s'appelle speciesfinder.py. l'extension .py indique qu'il s'agit d'un script utilisant le langage python pour s'exécuter. Les scripts écrits dans d'autres langages ont des extensions de fichier différentes, telles que .pl (perl), .c \(C\), .java (java), et .rb (ruby). L'extension de fichier pour un script shell est .sh. 

Voici une liste de certaines variables d'environnement courantes à connaître :

|Variable| Définition|
| ----------- | -------------- |
|**$USER**| Le nom d'utilisateur de l'utilisateur exécutant le script |
|**$HOSTNAME**| Le nom d'hôte de l'ordinateur exécutant le script|
|**$PWD** | Le répertoire de travail actuel|
|**$HOME**| Le répertoire personnel de l'utilisateur|
|**$#**|Combien de paramètres de ligne de commande ont été passés au script|
|**$@**| Tous les paramètres de ligne de commande passés au script|
|**$0**| Le script utilisé|
|**$1**| Le premier paramètre de ligne de commande passé au script|
|**$2**| Le deuxième paramètre de ligne de commande passé au script|
|**$?**| Le code de sortie du dernier processus ayant été exécuté|
|**$$**| L'identifiant de processus (PID) du script en cours|
|**$SECONDS**| Le nombre de secondes pendant lesquelles le script a été exécuté|
|**$RANDOM** | Renvoie un nombre aléatoire|
|**$LINENO** | Renvoie le numéro de ligne actuel du script|

### Utilisation des variables

Une fois que nous avons enregistré la variable en bash, comment l'utilisons-nous ?

```
[orkin@login1 2_Unix2]$ geneSequence='GATTACA'
[orkin@login1 2_Unix2]$ echo geneSequnce
[orkin@login1 2_Unix2]$ geneSequence
```

```echo``` s'attend à recevoir une chaîne de caractères, donc lorsque vous écrivez ```echo geneSequence``` ou ```echo 'geneSequence'``` dans l'invite de commande, il ne s'attend pas à une variable. Lors de l'appel d'une variable scalaire, vous devez indiquer à bash que ce que vous tapez est une variable scalaire en plaçant un caractère $ devant le nom de la variable. J'aime penser au $ comme à la lettre spéciale S qui signifie 'scalaire'.

```
[orkin@login1 2_Unix2]$ echo $geneSequnce
[orkin@login1 2_Unix2]$ GATTACA
```

Vous pouvez également mélanger des variables et des chaînes de caractères dans une seule ligne de code.

```
[orkin@login1 2_Unix2]$ echo "Mon en-tête fasta est : $fastaHeader La séquence nucléotidique correspondante est : $fastaSequence"
Mon en-tête fasta est : >HM757933.1|Pan paniscus isolate PPN-8 SRY. La séquence nucléotidique correspondante est : AGAGTGAAGCGACCCATGAACGCATTCTTCGTGTGGTCTCGCGATCAGAGGCGCAAGATGGCTCTAGAGAATCC
[orkin@login1 2_Unix2]$ 
```

Si vous souhaitez diviser cela sur plusieurs lignes, vous pouvez ajouter le caractère de saut de ligne, **\n**, mais vous devez indiquer à echo que vous utilisez des caractères spéciaux avec une option -e

```
[orkin@login1 2_Unix2]$ echo -e "Mon en-tête fasta est : $fastaHeader\nLa séquence nucléotidique correspondante est : $fastaSequence"
Mon en-tête fasta est : >HM757933.1|Pan paniscus isolate PPN-8 SRY
La séquence nucléotidique correspondante est : AGAGTGAAGCGACCCATGAACGCATTCTTCGTGTGGTCTCGCGATCAGAGGCGCAAGATGGCTCTAGAGAATCC
[orkin@login1 2_Unix2]$ 
```
Remarquez ici également que j'ai utilisé des guillemets doubles au lieu de guillemets simples. La plupart du temps, lorsque vous utilisez des **guillemets simples**, bash interprète les informations comme une chaîne de caractères. Lorsque vous voulez que bash interprète la variable, assurez-vous d'utiliser des **guillemets doubles**.

Une autre chose à surveiller est l'espacement entre les noms de vos variables et les caractères suivants dans votre chaîne. Supposons que vous vous souveniez qu'il y a en fait 5 A à la fin de la séquence nucléotidique que vous avez enregistrée ? Comment ajouter ces nouveaux caractères à votre variable ? 

```
[orkin@login1 2_Unix2]$ echo "$fastaSequenceAAAAA"

[orkin@login1 2_Unix2]$ echo '$fastaSequenceAAAAA'
$fastaSequenceAAAAA
[orkin@login1 2_Unix2]$
```
Ça n'a pas fonctionné, car bash recherche une variable nommée $fastaSequenceAAAAA qui n'existe pas. Il existe quelques façons de faire cela. Tout d'abord, vous pouvez indiquer à bash quelle partie du texte est la variable à interpoler et quelle partie est une chaîne supplémentaire à ajouter à la fin en utilisant des accolades ```{ }``` après le signe dollar.

```
[orkin@login1 2_Unix2]$ echo "${fastaSequence}AAAAA"
ATTGCTAGTCGTAGCTAGCTAGCTAGCTGTACGTGCTGTCGTAGCTGCTAGCTAGCTACGTAGCATCGTCGATCTACGTAAAAA
[orkin@login1 2_Unix2]$
```

Vous pourriez également créer une nouvelle variable et imprimer les deux variables ensemble.

```
[orkin@login1 2_Unix2]$ fasta5Atail='AAAAA' 
echo "$fastaSequence$fasta5Atail"
ATTGCTAGTCGTAGCTAGCTAGCTAGCTGTACGTGCTGTCGTAGCTGCTAGCTAGCTACGTAGCATCGTCGATCTACGTAAAAA
[orkin@login1 2_Unix2]$
```
Ou vous pourriez enregistrer $fastaSequence en tant que combinaison de $fastaSequence et de $fasta5Atail

```
[orkin@login1 2_Unix2]$ fastaSequence=$fastaSequence$fasta5Atail
[orkin@login1 2_Unix2]$ echo $fastaSequence
ATTGCTAGTCGTAGCTAGCTAGCTAGCTGTACGTGCTGTCGTAGCTGCTAGCTAGCTACGTAGCATCGTCGATCTACGTAAAAA
[orkin@login1 2_Unix2]$
```
Notez un point important ici : **les variables bash peuvent être écrasées** lorsque vous les enregistrez comme autre chose. La variable du côté gauche de l'équation n'existe pas tant que le code du côté droit de l'équation n'a pas été exécuté. Même si vous avez déjà enregistré une variable avec le nom $fastaSequence, la "nouvelle" définition de $fastaSequence n'est pas enregistrée tant que $fasta5Atail n'est pas ajouté à l'ancienne définition de $fastaSequence.

#### Variables complexes

Vous pouvez également sauvegarder la sortie d'une commande dans une variable. Dans la dernière classe, nous avons utilisé ```sort``` et ```uniq``` pour supprimer les lignes en double de plusieurs fichiers concaténés.

```
[orkin@login1 2_Unix2]$ cat file1.txt file2.txt | sort | uniq
[orkin@login1 2_Unix2]$ 
Jane
Jean
Joe
John
Luca
Michelle
Nathalie
Rose
[orkin@login1 2_Unix2]$
```
Nous pouvons sauvegarder ce résultat (standard output) en tant que variable si nous mettons toute la ligne de commande dans une variable en l'encadrant de parenthèses avec un signe dollar

```
[orkin@login1 2_Unix2]$ uniqNames=$(cat file1.txt file2.txt | sort | uniq)
[orkin@login1 2_Unix2]$ echo $uniqNames
Jane Jean Joe John Luca Michelle Nathalie Rose
[orkin@login1 2_Unix2]$
```
#### Arithmétique en bash

bash n'est pas très bon en mathématiques, mais vous pouvez lui demander d'effectuer des opérations entières simples en plaçant les mathématiques à l'intérieur d'une variable avec deux ensembles de parenthèses

```
[orkin@login1 2_Unix2]$ echo $((4 + 2))
6
[orkin@login1 2_Unix2]$ 
```
Vous pouvez également sauvegarder cela en tant que variable pour l'appeler directement

```
[orkin@login1 2_Unix2]$ additionResult=$((4 + 2))
[orkin@login1 2_Unix2]$ echo $additionResult
6
[orkin@login1 2_Unix2]$ 
```
Ou si vous préférez, vous pouvez également utiliser une variable sauvegardée dans l'équation
```
[orkin@login1 2_Unix2]$ echo $(($daysLeft / 3))
3
[orkin@login1 2_Unix2]$ 
```

Les calculs en bash sont un peu plus compliqués si vous voulez utiliser des **nombres à virgule flottante**. Pour ce faire, vous devrez rediriger l'équation mathématique vers un programme différent comme ```awk```, ```bc``` ou ```printf```.

```
[orkin@login1 2_Unix2]$ echo "3.14 * 2" | bc -l
6.28
[orkin@login1 2_Unix2]$ echo "7.9 / $daysLeft" | bc -l
.87777777777777777777
[orkin@login1 2_Unix2]$ 
```

## Modifier la sortie en continu avec awk et sed

awk et sed sont deux autres commandes couramment utilisées pour analyser le type de fichiers texte que nous allons rencontrer. Ce sont en fait des langages indépendants pouvant être appelés à partir de la ligne de commande bash, donc ils peuvent faire beaucoup de choses ! Nous allons nous concentrer sur quelques tâches spécifiques.

Parfois, vous avez un fichier avec de nombreuses colonnes et vous n'êtes intéressé que par quelques-unes d'entre elles. Vous pouvez utiliser ```cut``` pour analyser un tableau de données, mais il est limité et parfois a du mal avec certains fichiers. awk est beaucoup plus flexible. Commençons par travailler avec le **fichier d'appel de variantes (VCF; variant call file)**, nommé sample.vcf. Commençons par jeter un œil aux 3 premières lignes et aux 3 dernières lignes pour avoir une meilleure idée de ce à quoi ressemble ce type de fichier. Nous pouvons le faire en appelant à la fois ```head``` et ```tail``` sur sample.vcf.

```
[orkin@login1 2_Unix2]$ head -3 sample.vcf
##fileformat=VCFv4.2
##FORMAT=<ID=AD,Number=R,Type=Integer,Description="Nombre d'observations pour chaque allèle">
##FORMAT=<ID=AO,Number=A,Type=Integer,Description="Nombre d'observations de l'allèle alternatif">
[orkin@login1 2_Unix2$ tail -3 sample.vcf
Chr1  413091  .  A  G  254.981  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:64:45,18:45:1678:18:633:-37.9319,0,-131.909
Chr1  413209  .  A  G  434.144  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:70:47,23:47:1789:23:837:-54.5579,0,-140.169
Chr1  425805  .  G  A  28.7684  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:29:30:23,7:23:878:7:262:-13.9201,0,-68.3644
[orkin@login1 2_Unix2]$
```

Bash peut également interpréter les résultats des appels à ```head``` et ```tail```  en redirigeant l'entrée standard à partir de la ligne de commande en utilisant la syntaxe suivante:

```cat <(head -3 sample.vcf) <(tail -3 sample.vcf)```. 

Ici, nous indiquons à bash que le texte entre les ensembles de parenthèses doit être exécuté en premier, puis que les résultats doivent être redirigés vers ```cat``` dans l'ordre de gauche à droite. Pensez-y comme une structure : ```programme <(commande) <(commande)```.

Quoi qu'il en soit, revenons au VCF. Ce que nous voyons en haut sont de nombreuses lignes avec des informations sur le fichier, chacune commençant par deux **dièses (#)**. Ce sont des lignes d'en-tête. Les en-têtes sont généralement indiqués en commençant par un #, qui est la manière standard d'indiquer qu'une ligne doit être traitée comme un commentaire plutôt que comme une ligne de données. Le reste du fichier contient des lignes d'informations sur les polymorphismes mononucléotidiques (SNP). Nettoyons le fichier en supprimant les ## en-têtes et examinons de plus près :

```
[orkin@login1 ~]/COURS/FICHIERS$ grep -v "##" sample.vcf | head -3
#CHROM  POS  ID  REF  ALT  QUAL  FILTER  INFO  FORMAT  NomEchantillon
Chr1  534  .  G  A  386.826  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:53:33,20:33:1159:20:728:-49.4602,0,-88.5576
Chr1  558  .  T  C  616.84  .  .  GT:GQ:DP:AD:RO:QR:AO:QA:GL  0/1:99:51:26,25:26:901:25:949:-70.1497,0,-65.8674
```
Ce que nous voyons ici est un deuxième type de ligne d'en-tête qui commence par un seul dièse. Cette en-tête donne les noms de chaque colonne, qui sont Chromosome, Position, ID, Allèle de référence, Allèle alternatif, Score de qualité, Paramètre de filtrage, Autres informations, Format des données d'échantillon, Données d'échantillon. Nous parlerons plus des VCF plus tard, mais pour l'instant, nous voulons juste nettoyer le fichier pour pouvoir le lire plus clairement.

### awk

Imprimons nos colonnes 1, 2, 4, 5 et 10. Pour chaque SNP, cela nous donnera le chromosome, la position, l'allèle de référence, l'allèle alternatif et les informations sur l'échantillon. Nous pouvons le faire en redirigeant la sortie de ```grep -v``` vers ```awk```.

```
[orkin@login1 2_Unix2]$ grep -v "##" sample.vcf | awk '{print $1"\t"$2"\t"$4"\t"$5"\t"$10}' | head 
#CHROM  POS  REF  ALT  SampleName
Chr1  534  G  A  0/1:99:53:33,20:33:1159:20:728:-49.4602,0,-88.5576
Chr1  558  T  C  0/1:99:51:26,25:26:901:25:949:-70.1497,0,-65.8674
Chr1  709  A  G  0/1:99:62:37,22:37:1313:22:746:-49.2234,0,-100.363
Chr1  765  C  G  0/1:99:58:36,21:36:1295:21:712:-46.6599,0,-98.3786
```
Maintenant nous pouvons voir plus clairement. Il y a encore beaucoup d'informations désordonnées dans la dernière colonne qui ne nous intéressent pas, mais nous y viendrons dans un moment. Expliquons d'abord l'appel à ```awk```.

1) Parce qu'awk est son propre langage, il a sa propre syntaxe et l'instruction awk doit être mise entre guillemets.  
```awk ''```

2) awk peut faire beaucoup de choses, et si nous voulons simplement qu'il imprime quelque chose, nous devons lui dire d'utiliser sa fonction d'impression interne, appelée ```print```, que nous mettrons dans un bloc de code séparé, entouré d'accolades.  
```awk '{print}'```

3) Ensuite, nous devons dire à ```awk``` ce qu'il doit imprimer. ```awk``` code chaque colonne comme une variable numérique. Ainsi, la première colonne est $1, la cinquième colonne est $5, et ainsi de suite.  
```awk '{print $1$2$4$5$10}'```

4) Enfin, nous devons dire à ```awk``` quel type de caractère utiliser pour séparer chaque colonne qu'il imprime. Ces caractères sont des chaînes de caractères, nous devrons donc les mettre entre guillemets. Un caractère de tabulation est le plus clair, nous allons donc insérer le caractère spécial pour tabulation ```\t```.  
```awk '{print $1"\t"$2"\t"$4"\t"$5"\t"$10}'```

Ce qui rend awk si flexible ici, c'est que vous pouvez réorganiser les colonnes de n'importe quelle manière et mettre n'importe quoi entre elles. Essayez!

### sed

Tout comme ```awk```, ```sed``` est son propre langage, mais il fait des choses très différentes. ```sed``` est particulièrement bon pour effectuer des recherches et des remplacements. La structure de base de ```sed``` avec laquelle nous allons travailler ressemble à ceci :

```sed 's/ / /'```

Le s indique que vous demandez à ```sed``` d'effectuer une substitution. Les trois barres obliques sont écrites pour séparer deux espaces dans lesquels vous pouvez placer le texte à rechercher, suivi du texte par lequel vous le remplacez. Regardons le file4.txt.

```
[orkin@login1 2_Unix2]$ cat file4.txt
framboise
pomme
raisin
orange
```
Supposons que nous voulions remplacer 'pomme' par 'pomme de terre'. Nous pourrions le faire avec ```sed``` :

```
[orkin@login1 2_Unix2]$ sed 's/pomme/pomme de terre/' file4.txt
framboise
pomme de terre
raisin
orange
```
Nous pouvons également remplacer une ou plusieurs lettres par n'importe quoi d'autre

```
[orkin@login1 2_Unix2]$ sed 's/o/T/' file4.txt
frambTise
pTmme de terre
raisin
Trange

[orkin@login1 2_Unix2]$ sed 's/s/\n/' file4.txt
framboi
e
pomme
rai
in
orange
```
Si nous voulons supprimer certains caractères, nous pouvons le faire en laissant le dernier espace vide
```
[orkin@login1 2_Unix2]$ sed 's/m//' file4.txt
fraboise
poe
raisin
orange
```
Une chose particulièrement puissante à propos de sed est que nous pouvons également utiliser des **caractères génériques (wildcards)**. Nous en parlerons plus en détail lorsque nous aborderons les expressions régulières, mais pour l'instant, sachez que le point ```.``` est le caractère générique pour "n'importe quel caractère qui n'est pas un espace" et le signe astérisque ```*``` signifie "zéro ou plusieurs occurrences des caractères précédents". Ainsi, ```.*``` signifie tout, de cette position dans la ligne jusqu'à la fin de la ligne.

```
[orkin@login1 2_Unix2]$ sed 's/o.*//' file4.txt
framb
p
raisin
range
```
Regroupons tout cela pour terminer l'édition de notre VCF.

```
[orkin@login1 2_Unix2]$ grep -v "##" sample.vcf | awk '{print $1"\t"$2"\t"$4"\t"$5"\t"$10}' | sed ' s/:.*//' |head -5

#CHROM  POS  REF  ALT  SampleName
Chr1  534  G  A  0/1
Chr1  558  T  C  0/1
Chr1  709  A  G  0/1
Chr1  765  C  G  0/1
```
Vous pouvez maintenant voir que c'est très propre. La commande ```sed``` ```sed ' s/:.*//'``` a recherché le premier deux-points sur la ligne, puis a supprimé le deux-points et tout ce qui suit sur la ligne.

Lien vers l'énoncé du problème d'aujourd'hui :

Anglais : [Unix2 Problemset](https://github.com/nomascus/ANT3814/blob/main/PROBLEM_SETS/Unix2_problemSet_English.md)  
Français : [Unix2 Problemset](https://github.com/nomascus/ANT3814/blob/main/PROBLEM_SETS/Unix2_problemSet_Francais.md)

