# ANT3814: Seminar d'anthropologie -  Computational Methods in Molecular Anthropology

## Cours 1 : La ligne de commande Unix

Le matériel de cours d'aujourd'hui est adapté et traduit en français à partir de Programming for Biology [programmingforbiology.org](http://programmingforbiology.org)  et a été initialement rédigé par Simon Prochnik et Sofia Robb. Une grande partie de ce matériel de cours est librement disponible en ligne. Il est également proposé sous forme de [cours intensif]([https://meetings.cshl.edu/courses.aspx?course=c-info&year=24]) de deux semaines au Cold Spring Harbor Laboratory pour apprendre Python pour la bioinformatique.

# Grande idée

## Pourquoi ?

Pourquoi est-il important pour les **anthropologues biologiques** d'apprendre à programmer ?

Vous pourriez déjà connaître la réponse à cette question puisque vous êtes ici.

Nous croyons fermement que savoir programmer est tout aussi essentiel que savoir comment faire fonctionner un gel ou configurer une réaction PCR. Les données que nous obtenons maintenant à partir d'une seule expérience peuvent être écrasantes. Ces données doivent souvent être reformatées, filtrées et analysées de manière unique. La programmation vous permet d'accomplir ces tâches de manière **efficace** et **reproductible**.

Voici nos conseils pour suivre avec succès un cours de programmation :

1. Pratiquez, pratiquez, pratiquez. Consacrez autant de temps que possible à coder réellement.

2. Écrivez seulement une ou deux lignes de code, puis testez-les. Si vous écrivez trop de lignes, il devient plus difficile de déboguer en cas d'erreur.

3. Les erreurs ne sont pas des échecs. Chaque erreur est une occasion d'apprentissage. Chaque erreur que vous déboguez est un succès majeur. Corriger les erreurs est un moyen de consolider ce que vous avez appris.

4. Ne passez pas trop de temps à essayer de résoudre un problème. Bien que ce soit une excellente expérience d'apprentissage de tenter de résoudre un problème par vous-même, cela n'est pas amusant de se frustrer ou de rester bloqué pendant longtemps. Je suis là pour vous aider, alors demandez-moi chaque fois que vous avez besoin d'aide.

5. Les cours magistraux sont importants, mais la pratique l'est davantage.

6. Notre objectif principal est de vous apprendre progressivement, mais sûrement, à résoudre des problèmes par vous-même.

# Unix (Linux, macOS)

### Vue d'ensemble de Unix

### Qu'est-ce que la ligne de commande ?

Sous-jacent à l'interface graphique (GUI) agréable de Mac OSX se trouve le système d'exploitation (OS). Il est basé sur BSD, qui est une version de Unix. Linux est assez similaire et également un système d'exploitation très courant en bioinformatique, où vous rencontrerez des dialectes comme Red Hat, Ubuntu et d'autres.

La ligne de commande vous donne accès aux entrailles du système d'exploitation, et c'est également un moyen pratique d'écrire des logiciels personnalisés et des scripts.

La plupart des outils de bioinformatique sont écrits pour fonctionner en ligne de commande et n'ont pas d'interface graphique. Dans de nombreux cas, un outil en ligne de commande est plus polyvalent qu'un outil graphique, car vous pouvez facilement combiner des outils en ligne de commande dans des scripts automatisés qui accomplissent des tâches personnalisées de manière séquentielle sans intervention humaine.

Dans ce cours, nous utiliserons Linux et R pour écrire des scripts et les exécuter à partir de la ligne de commande.

Le système d'exploitation Unix est compliqué et il y a toujours plus de choses à apprendre à son sujet. Nous couvrirons simplement suffisamment pour vous permettre de commencer.

### Les bases

#### Connexion à votre ordinateur

Votre ordinateur dans cette salle de classe est un PC Windows. Cependant, Windows n'est pas un système d'exploitation Unix et ne possède pas les mêmes systèmes pour les commandes opérationnelles de la structure de fichiers. Si votre ordinateur personnel est un Mac ou s'il fonctionne déjà avec un système d'exploitation Linux, c'est génial ! Sinon, nous devrons vous connecter à un système d'exploitation Linux, nous pouvons le faire de deux manières.

#### Machine virtuelle Linux

Pour utiliser Linux sous Windows, nous devons charger un système d'exploitation Linux sous forme de "machine virtuelle" (VM). Nous pouvons installer Ubuntu, une version de Linux, avec un programme gratuit appelé VirtualBox.

Le système d'exploitation Ubuntu est très similaire à Windows et macOS. Pour vous connecter, fournissez votre nom d'utilisateur et votre mot de passe. Votre nom d'utilisateur est 'student' et le mot de passe est 'darwin1859'. Pour notre cours, nous devrons charger une application appelée "terminal" qui nous permet d'accéder à la ligne de commande.

#### Mise en place de la ligne de commande

Pour ouvrir la ligne de commande, utilisez l'application appelée "terminal" que j'ai ajoutée à la barre des tâches sur le côté gauche de l'écran. Cela ouvrira une fenêtre comme celle-ci :

![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/UbuntuTerminal.png?raw=true)

Vous pouvez ouvrir plusieurs fenêtres de Terminal en même temps. Cela est souvent utile. Une manière courante de travailler est d'ouvrir votre éditeur de code dans une fenêtre, d'exécuter le code à partir d'une autre et de visualiser les données et les fichiers dans une autre.

#### D'accord. Je me suis connecté. Et maintenant ?

La fenêtre de terminal exécute un **shell** appelé **bash**. Le shell est une boucle qui :
1. Affiche une invite
2. Lit une ligne d'entrée depuis le clavier
3. Analyse la ligne en une ou plusieurs commandes
4. Exécute les commandes (qui affichent généralement une sortie sur le terminal)
5. Retourne à l'étape 1.

Il existe de nombreux shells différents avec des noms bizarres comme **bash**, **sh**, **csh**, **tcsh**, **ksh** et **zsh**. La partie "sh" signifie shell. Chaque shell a une syntaxe et des fonctionnalités légèrement différentes. **bash** est standard dans les systèmes Linux, mais Mac OS est récemment passé de bash à **zsh**, mais ils sont tous les deux très similaires.

#### Invite de commande

La plupart de la bioinformatique est effectuée en exécutant des logiciels en ligne de commande dans un shell, donc vous devriez prendre le temps d'apprendre à utiliser le shell efficacement.

Voici une invite de commande :
```
student@ant3814:~$
```

Voici une autre :
```
$ 1:12PM>
```
Voici une autre :
```
[orkin@narval3 projects]$
```

Ce que vous voyez dépend de la façon dont l'administrateur système a personnalisé votre connexion. Vous pouvez également le personnaliser vous-même (mais nous n'aborderons pas cela ici).

L'invite vous indique que le shell est prêt pour que vous saisissiez une commande. La plupart des commandes s'exécutent presque instantanément, mais si vous exécutez une longue commande, l'invite ne réapparaîtra pas avant qu'elle ne soit terminée et que le système soit prêt à accepter votre prochaine demande.

#### Émission de commandes

Vous saisissez une commande et appuyez sur la touche **Enter** pour l'exécuter. Si la commande génère une sortie, elle s'affichera à l'écran. Par exemple :

```
student@ant3814:~$ ls
COURS 		Desktop		Downloads	Pictures	readme.txt	snap	transitions.txt
data.txt	Documents	Music		Public		results.txt	Templates	Videos
student@ant3814:~$
```

La commande ici est `ls`, qui affiche la liste des fichiers et répertoires dans le répertoire courant (nous verrons cela plus tard). En dessous de sa sortie, l'invite de commande réapparaît.

Certains programmes prendront beaucoup de temps à s'exécuter. Après avoir lancé leur commande, vous ne récupérerez pas l'invite de commande du shell tant qu'ils ne seront pas terminés. Vous pouvez continuer à travailler entre-temps, soit en lançant un nouveau shell (à partir du menu Fichier de Terminal), soit en exécutant la commande en arrière-plan en ajoutant un esperluette à la fin de la commande comme ceci :

```
student@ant3814:~$ long_running_application &
student@ant3814:~$
```
> La commande s'exécutera maintenant en arrière-plan jusqu'à ce qu'elle soit terminée. Si elle génère une sortie, celle-ci sera affichée dans la fenêtre du terminal. Vous pouvez souhaiter capturer la sortie dans un fichier (appelé redirection). Nous décrirons cela plus tard.

#### Édition de ligne de commande

La plupart des shells offrent une édition de ligne de commande. Jusqu'au moment où vous appuyez sur **Enter**, vous pouvez revenir en arrière sur la ligne de commande et la modifier en utilisant le clavier. Voici les raccourcis clavier les plus utiles :

- _Retour arrière_ : Supprime le caractère précédent et recule d'un.
- _Flèche gauche, flèche droite_ : Déplace le point d'insertion du texte (curseur) d'un caractère vers la gauche ou la droite.
- _control-a (^a)_ : Déplace le curseur au début de la ligne. (Mnémonique : A est la première lettre de l'alphabet)
- _control-e (^e)_ : Déplace le curseur à la fin de la ligne. (Mnémonique : E pour la fin) (^z est déjà utilisé pour interrompre une commande).
- _control-d (^d)_ : Supprime le caractère actuellement sous le curseur. D=Delete.
- _control-k (^k)_ : Supprime toute la ligne du curseur à la fin. k=kill. La ligne n'est pas réellement supprimée, mais placée dans un endroit temporaire appelé "tampon de suppression". C'est comme couper du texte.
- _control-y (^y)_ : Colle le contenu du tampon de suppression sur la ligne de commande à partir du curseur. y=yank. C'est comme coller.
- _control-c (^c)_ permet d'envoyer un signal d'interruption, qui annule ou termine le programme en cours. Cela interrompt ce que vous êtes en train de taper et vous ramène à l'invite.
- _Flèche haut, flèche bas_ : Déplacez-vous vers le haut et vers le bas dans l'historique des commandes. Cela vous permet de réexécuter des commandes précédentes, éventuellement en les modifiant avant de le faire.

Il existe également quelques commandes shell utiles que vous pouvez exécuter :

- `history` : Affiche toutes les commandes que vous avez récemment exécutées, numérotées de manière agréable.
- `!<numéro>` : Réexécute une ancienne commande, en fonction de son numéro (que vous pouvez obtenir avec `history`).
- `!!` : Réexécute la dernière commande.
- `!<chaîne de commande partielle>` : Réexécute la commande précédente qui commence par les lettres indiquées. Par exemple, `!l` (la lettre L, pas le chiffre 1) réexécuterait la commande `ls` de l'exemple précédent.
- *control-r (^r)* : entrez une chaîne et recherchez dans l'historique les commandes qui correspondent. C'est vraiment utile.

**bash** offre également une complétion automatique des commandes et une correction orthographique. Si vous tapez une partie d'une commande puis la touche **tab**, il vous proposera toutes les complétions possibles de la commande. Par exemple :

```
student@ant3814:~$  le<tab><
less	lessecho	lessfile	lesskey		lesspipe	let		lexgrog
student@ant3814:~$ le
```
> Si vous appuyez sur la touche **tab** après avoir tapé une commande, mais avant d'appuyer sur **Enter**, **bash** vous proposera une liste de noms de fichiers. Cela est le

#### Wildcards

Vous pouvez utiliser des caractères génériques pour faire référence à des fichiers. `*` représente zéro ou plusieurs caractères. `?` représente n'importe quel caractère unique. Par exemple, pour lister tous les fichiers avec l'extension ".txt", exécutez `ls` avec le motif générique "*.txt"

```
student@ant3814:~$ ls *.txt
data.txt	readme.txt	results.txt		transitions.txt
student@ant3814:~$ 
```

Il existe plusieurs types de modèles génériques avancés que vous pouvez lire dans la page manuel de **bash**. Par exemple, si vous souhaitez faire correspondre les fichiers commençant par les caractères "d" ou "r" et se terminant par ".txt", vous pouvez mettre les deux caractères entre crochets `[dr]` comme partie du modèle générique. Voici un exemple

```
student@ant3814:~$ ls [dr]*.txt
data.txt	readme.txt	results.txt
student@ant3814:~$
```
Vous pouvez également rechercher une plage de caractères par exemple `[a-e]` ou `[1-5]`.

### Répertoires et leur organisation

Un ordinateur dispose d'un endroit pour stocker des scripts, des données, des images, un système d'exploitation et d'autres fichiers. Autrefois, il s'agissait de disquettes, puis de disques durs et de nos jours, il s'agit souvent d'un disque d'état solide (SSD). Parlons de l'organisation du stockage pour vous aider à trouver sur quoi vous travaillez. Les répertoires ou dossiers sont créés à l'intérieur d'autres répertoires. Un répertoire est spécial. Il s'agit du **répertoire racine (root)** car il n'est pas à l'intérieur d'autres répertoires (il est écrit `/`). Les fichiers qui vont ensemble sont créés à l'intérieur d'un répertoire pour les organiser. Cela crée une structure qui peut être représentée comme un arbre ramifié. Nous trouvons qu'il est plus clair de le retourner à l'envers pour ressembler à des racines de branchement. 

**Exemple de diagramme d'une structure de répertoire Linux à partir du répertoire racine**

![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/directory_structure.png?raw=true)


#### Home Sweet Home (votre répertoire personnel `~`)

Lorsque vous vous connectez pour la première fois, vous serez dans votre répertoire personnel (ou dossier), appelé le **répertoire personnel (home directory)**. Ce répertoire a le même nom que votre nom de connexion, et sous Linux, il se trouve généralement dans `/home` (sous macOS, il se trouve à l'intérieur du répertoire `/Users`). Si votre nom d'utilisateur est `jdesjardins`, votre répertoire personnel serait `/Users/jdesjardins`. Il s'agit d'un chemin d'accès ou d'un chemin. Unix est rempli d'abréviations pour économiser la saisie des choses courantes. L'interpréteur de commandes vous permet de l'abréger en `~username` (où "username" est votre nom d'utilisateur ou celui de quelqu'un d'autre), ou simplement en `~`. Le caractère `~` (appelé "tilde") se trouve dans le coin supérieur gauche de votre clavier.

Dans votre répertoire personnel, vous avez la permission d'enregistrer, de supprimer, d'ouvrir et de déplacer des fichiers et d'autres répertoires. En général, vous pouvez lire mais pas écrire ou modifier des fichiers ailleurs dans le système.

Pour voir ce qui se trouve dans votre répertoire personnel, utilisez la commande `ls` pour lister le contenu du répertoire

![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/ls-home.png?raw=true)

Vous pouvez modifier la manière dont une commande fonctionne avec des **commutateurs (switches)**. Ceux-ci sont des lettres uniques tapées après un tiret `-`. La casse est importante. Ainsi, `ls -aF` répertorie tous (all) `a` les fichiers, y compris les noms de fichiers cachés qui commencent par un `.` avec un formatage élaboré (fancy) `F` de telle sorte qu'un `/` soit ajouté à la fin des noms de répertoires.

![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/ls-aF.png?raw=true)

> Ne supprimez pas les fichiers cachés. Beaucoup d'entre eux sont des fichiers de configuration essentiels pour les commandes et d'autres programmes. Par exemple, le fichier `.bashrc` contient des informations de configuration pour l'interpréteur de commandes **bash**. Vous pouvez le modifier (un peu plus tard, lorsque vous saurez ce que vous faites) pour modifier des choses comme l'invite de commande et le chemin de recherche des commandes.

#### Changer de répertoire

Vous pouvez vous déplacer d'un répertoire à l'autre en utilisant la commande `cd` (pour changer de répertoire / change directory). Indiquez le nom du répertoire dans lequel vous souhaitez vous rendre, ou ne donnez aucun nom pour revenir à votre répertoire personnel. Utilisez la commande `pwd` (print working directory) pour voir où vous êtes (ou, si configuré, cette information apparaîtra dans l'invite) :

```
student@ant3814:~$ cd Documents 
student@ant3814:~/Documents$  pwd
/home/student/Documents
student@ant3814:~/Documents$ cd
student@ant3814:~$ cd /
student@ant3814: / % ls -F

```
![enter image description here](https://github.com/nomascus/ANT3814/blob/main/FILES/ls-root.png?raw=true)


Chaque répertoire contient deux répertoires spéciaux cachés nommés `.` et `..`. Le premier, `.` fait toujours référence au répertoire actuel. `..` fait référence au répertoire parent. Cela vous permet de remonter dans la hiérarchie des répertoires de cette manière :

```
student@ant3814:~/Documents$ cd ..
```
et de faire des choses sympas comme ça :

```
student@ant3814:~/Documents$ cd ../../student/Documents
```

> Cette dernière commande monte deux niveaux, puis entre dans un répertoire appelé `Documents` à l'intérieur d'un répertoire appelé `student`.

Si vous vous perdez, la commande `pwd` affiche le chemin complet du répertoire actuel :

```
student@ant3814:~/Documents$ pwd
/home/student/Documents
```

#### Chemins (paths) absolus et relatifs

Nous pouvons taper un chemin de deux manières, un chemin absolu commence toujours par un caractère `/` et se lit à partir du répertoire racine. Un chemin relatif commence par un autre caractère et se lit à partir du répertoire dans lequel vous vous trouvez actuellement. Voici deux façons d'accéder à un répertoire appelé `Music` dans le répertoire personnel de l'utilisateur `student`. À partir de `Documents`, nous pouvons monter d'un répertoire puis descendre dans `Music` (chemin relatif) ou aller de `/` à `home` à `ant3814` à `Music` (chemin absolu).

```
student@ant3814:~/Documents$ cd ../Music   
student@ant3814:~/Music$ cd
student@ant3814:~$ cd /home/student/Music
student@ant3814:~/Music$ 
```

> Lequel de ces chemins fonctionnerait pour un utilisateur différent ainsi que pour `student` ?

### Commandes Unix Essentielles

À l'exception de quelques commandes intégrées directement dans l'interpréteur de commandes (par exemple `history`, `for`, `if`), toutes les commandes Unix sont en fait des programmes exécutables. Lorsque vous tapez le nom d'une commande, l'interpréteur de commandes recherchera dans tous les répertoires répertoriés dans la variable d'environnement PATH un exécutable portant le même nom. S'il le trouve, l'interpréteur de commandes exécutera la commande. Sinon, il affichera une erreur "command not found".

La plupart des commandes se trouvent dans `/bin`, `/sbin`, `/usr/bin`, `/usr/sbin/` ou `/usr/local/bin`.

#### Obtenir des informations sur les commandes

La commande `man` donnera un bref résumé d'une commande. Obtenons des informations sur la commande `wc`."

```
student@ant3814:~$ man wc
Formatting page, please wait...
WC(1)                                                       WC(1)

NAME
       wc - print the number of bytes, words, and lines in files

SYNOPSIS
       wc [-clw] [--bytes] [--chars] [--lines] [--words] [--help]
       [--version] [file...]

DESCRIPTION
       This manual page documents the  GNU  version  of  wc.   wc
       counts  the  number  of bytes, whitespace-separated words,
```

#### Trouver les commandes sur votre ordinateur

La commande `apropos` va rechercher les commandes correspondant à un mot-clé ou une phrase. Voici un exemple qui cherche les commandes liées à 'column'

```
student@ant3814:~$ apropos column
showtable (1)        - Show data in nicely formatted columns
colrm (1)            - remove columns from a file
column (1)           - columnate lists
fix132x43 (1)        - fix problems with certain (132 column) graphics
modes
```

#### Arguments et options en ligne de commande

De nombreuses commandes prennent des arguments. Les arguments sont souvent les noms d'un ou plusieurs fichiers sur lesquels agir. La plupart des commandes prennent également des "options" ou "paramètres" en ligne de commande, qui affinent ce que fait la commande. Certaines commandes reconnaissent des "options courtes" qui consistent en un signe moins `-` suivi d'un ou plusieurs caractères simples, tandis que d'autres reconnaissent des "options longues" consistant en deux signes moins `--` suivis d'un mot entier.

Le programme `wc` (comptage de mots) est un exemple de commande qui reconnaît à la fois les options longues et courtes. Vous pouvez lui passer les options `-c`, `-w` et/ou `-l` (ou des combinaisons d'entre elles) pour compter respectivement les caractères, les mots et les lignes dans un fichier texte. Ou vous pouvez utiliser les options plus longues mais plus lisibles `--chars`, `--words` ou `--lines`. Ces deux exemples comptent le nombre de caractères et de lignes dans le fichier texte `/var/log/README` :

```
student@ant3814:~$ wc -c -l /var/log/README
     25     1041 /var/log/README
student@ant3814:~$ wc --chars --lines /var/log/messages
     25     1041 /var/log/README
```

Vous pouvez regrouper les options d'un caractère en les concaténant, comme le montre cet exemple :

```
student@ant3814:~$ wc -cl /var/log/README
     25     1041 /var/log/README
```

De nombreuses commandes fourniront un bref résumé d'utilisation lorsque vous les appelez avec l'option `-h` ou `--help`.

#### Espaces, tabulations et caractères de nouvelle ligne

Le shell utilise des espaces pour séparer les arguments. Si vous voulez inclure un espace (voir ci-dessous pour d'autres caractères d'espacement ou caractères non imprimables comme une tabulation ou une nouvelle ligne, etc.) dans un argument, mettez-le entre guillemets simples. Par exemple :

```
mail -s 'Un message important' 'Bob Ghost <bob@ghost.org>'
```
Cela enverra un e-mail à la personne fictive Bob Ghost. L'option `-s` prend un argument, qui est la ligne d'objet de l'e-mail. Comme la ligne d'objet souhaitée contient des espaces, elle doit être entre guillemets. De même, mon nom et mon adresse e-mail, qui contiennent des espaces intégrés, doivent également être entre guillemets de cette manière.

Certains caractères spéciaux non imprimables ont des _codes d'échappement_ associés :

| Code d'échappement | Description                                                   |
| ------------------- | ------------------------------------------------------------- |
| \\n                 | caractère de nouvelle ligne  (new line)                                 |
| \\t                 | caractère de tabulation    (tab)                                   |
| \\r                 | caractère de retour chariot (carriage return)                                  |
| \\a                 | caractère de sonnerie (ding! ding!)                           |
(https://www.rapidtables.com/code/text/ascii-table.html)|

### Commandes utiles

Voici quelques commandes qui sont utilisées extrêmement fréquemment. Utilisez `man` pour en savoir plus sur elles. Certaines de ces commandes peuvent être utiles pour résoudre le problème posé ;-)

#### Manipulation de répertoires

| Commande | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `ls`     | Liste des répertoires. Utilisé le plus souvent avec `ls -F` (liste décorée), `ls -l` (liste longue), `ls -a` (liste tous les fichiers). |
| `mv`     | Renommer ou déplacer un fichier ou un répertoire.    (move)        |
| `cp`     | Copier un fichier. `cp -r` (de manière récursive) pour copier des répertoires. |
| `rm`     | Supprimer un fichier. `rm olddata.tsv` (remove)                  |
| `mkdir`  | Créer un répertoire  (make directory)                                        |
| `ln`     | Créer un lien symbolique ou dur. `ln -s` crée un lien symbolique (sym) |
| `chmod`  | Modifier les permissions d'un fichier ou d'un répertoire.  (change mode)  |

#### Lecture des fichiers

| Commande           | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| `cat`             | Programme de concaténation. Peut être utilisé pour concaténer plusieurs fichiers en un seul, ou, beaucoup plus fréquemment, pour afficher le contenu d'un fichier ou de fichiers dans le terminal. |
| `more`            | Parcourir un fichier page par page. Très utile lors de la visualisation de grands fichiers. Fonctionne même avec des fichiers trop volumineux pour être ouverts par un éditeur de texte. |
| `less`            | Une version de `more` avec plus de fonctionnalités.                      |
| `head`            | Affiche les premières lignes d'un fichier. Vous pouvez contrôler le nombre de lignes à afficher avec `head -3` qui affiche les trois premières lignes. |
| `tail`            | Affiche la fin d'un fichier. Vous pouvez contrôler le nombre de lignes à afficher. Vous pouvez également utiliser `tail -f` pour afficher un fichier auquel vous écrivez. |

#### Analyse et traitement des fichiers
| Commande | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `wc`              | Compter les mots, les lignes et/ou les caractères dans un ou plusieurs fichiers.  (word count) |
| `sort`            | Trier les lignes d'un fichier par ordre alphabétique ou numérique (-g ou -n) dans l'ordre inverse (-r). |
| `uniq`            | Supprimer les lignes dupliquées dans un fichier. (unique)                          |
| `cut`             | Supprimer des colonnes de chaque ligne d'un fichier ou de fichiers.           |
| `grep`            | Filtrer un fichier pour les lignes correspondant à un motif spécifié. Peut également être inversé pour afficher les lignes qui ne correspondent pas au motif spécifié. |
| `gzip` (`gunzip`) | Compresser (décompresser) un fichier.                                |
| `tar`             | Archiver ou désarchiver un répertoire entier dans un seul fichier. |

#### Édition des fichiers
| Commande | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `tr`              | Substituer un caractère par un autre.  Utile également pour supprimer des caractères. (translate)|
| `emacs`           | Exécuter l'éditeur de texte Emacs (bon pour les experts).                |
| `vi`              | Exécuter l'éditeur de texte vi (bon pour les experts).         |
| `echo`            | Afficher du texte à l'écran. Par exemple, `echo 'Bonjour le monde !'` |


#### Connexion à d'autres ordinateurs

| Commande                | Description                                                  |
| ---------------------- | ------------------------------------------------------------ |
| `ssh`                  | Un moyen sécurisé (crypté) de se connecter à des machines.    (secure shell)           |
| `scp`                  | Un moyen sécurisé de copier (cp) des fichiers vers et depuis des machines distantes. (secure copy)|

#### Entrées/Sorties Standards et Redirection

Les commandes Unix affichent leur sortie sur le terminal (écran) pour que vous puissiez la voir, et elles acceptent en entrée des données du clavier (c'est-à-dire de _vous_!)

Chaque programme Unix démarre avec trois connexions vers l'extérieur. Ces connexions sont appelées des **flux**, car elles agissent comme un flux d'informations (au sens figuré):

| Nom du Flux   | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| entrée standard (standard input) | Elle est initialement attachée au clavier. Lorsque le programme lit depuis l'entrée standard, il lit tout texte que vous tapez. |
| sortie standard (standard output)| Ce flux est initialement attaché au terminal. Tout ce que le programme imprime sur ce flux apparaît dans votre fenêtre de terminal. |
| erreur standard  (standard error)| Ce flux est également initialement attaché au terminal. C'est un flux séparé destiné à l'affichage des messages d'erreur. |

Le mot "initialement" pourrait vous faire penser que l'entrée standard, la sortie standard et l'erreur standard peuvent d'une manière ou d'une autre être détachées de leurs emplacements de départ et rattachées ailleurs. Et vous auriez raison. Vous pouvez attacher un ou plusieurs de ces trois flux à un fichier, un périphérique, ou même à un autre programme. Cela semble ésotérique, mais c'est en fait très utile.

#### Un Exemple Simple

Le programme `wc` compte les lignes, les caractères et les mots dans les données envoyées à son entrée standard. Vous pouvez l'utiliser de manière interactive comme ceci:

```
student@ant3814:~$ wc
Alouette, gentille alouette,  
Alouette, je te plumerai

Je te plumerai la tete
Je te plumerai la tete
Alouette, alouette
A a a ah
^d                    # ** REMARQUE - ceci est ctrl-d que vous tapez, mais aucune sortie n'apparaît
                      # dans la fenêtre du terminal
      6      23     126
```
Dans cet exemple, j'ai exécuté le programme `wc`. Il a attendu que je tape un petit poème. Lorsque j'ai eu terminé, j'ai tapé le caractère FIN-DE-FICHIER, contrôle-d (^d en abrégé). `wc` a alors imprimé trois nombres indiquant le nombre de lignes (6), de mots (23) et de caractères (126) dans l'entrée.

Plus souvent, vous voudrez compter le nombre de lignes dans un gros fichier et enregistrer les résultats dans un autre fichier. Nous verrons cela en deux étapes. Tout d'abord, nous envoyons la sortie de `wc` vers stdout. Dans la deuxième commande, nous _redirigeons_ stdout de `wc` vers un fichier avec le symbole `>`.

```
student@ant3814:~/COURS/FICHIERS$ wc big_file.fasta
      57    81    2423
student@ant3814:~/COURS/FICHIERS$ wc big_file.fasta > count.txt
```

Maintenant, si vous `cat` le fichier _count.txt_, vous verrez que les données ont été enregistrées.

```
student@ant3814:~$ cat count.txt
      57    81     2423
```

#### Métacaractères de Redirection

Voici la liste complète des commandes de redirection pour **bash**:

| Commande de redirection    | Description                              |
| ------------------- | ---------------------------------------- |
| `< myfile.txt`      | Rediriger le contenu du fichier vers l'entrée standard |
| `> myfile.txt`      | Rediriger la sortie standard vers un fichier         |
| `>> logfile.txt`    | Ajouter la sortie standard à la fin du fichier |
| `1> myfile.txt`    | Rediriger uniquement la sortie standard vers un fichier (identique à ci-dessus) |
| `2> myfile.txt`    | Rediriger uniquement l'erreur standard vers un fichier     |
| `&> myfile.txt` | Rediriger à la fois stdout et stderr vers un fichier  |

Ces redirections peuvent être combinées. Par exemple, cette commande redirige l'entrée standard depuis le fichier nommé `/etc/passwd`, écrit ses résultats dans le fichier `search.out`, et écrit ses messages d'erreur (s'il y en a) dans un fichier nommé `search.err`. Que fait-elle? Elle recherche le fichier de mots de passe pour un utilisateur nommé "root" et renvoie toutes les lignes qui se réfèrent à cet utilisateur.

```
student@ant3814:~$ grep root /etc/passwd > search.out 2> search.err
```

#### Filtres, Noms de Fichiers et Entrée Standard

De nombreuses commandes Unix agissent comme des filtres, prenant des données à partir d'un fichier ou de l'entrée standard, transformant les données, et écrivant les résultats sur la sortie standard. La plupart des filtres sont conçus pour être appelés avec un ou plusieurs noms de fichiers en ligne de commande, auquel cas ils utiliseront ces fichiers en entrée. Sinon, ils agiront sur l'entrée standard. Par exemple, ces deux commandes sont équivalentes:

```
student@ant3814:~/COURS/FICHIERS$ grep 'GATTTGC' big_file.fasta
student@ant3814:~/COURS/FICHIERS$ grep 'GATTTGC' < big_file.fasta
```
Les deux commandes utilisent la commande `grep` pour rechercher la chaîne "GATTGC" dans le fichier `big_file.fasta`. La première commande donne explicitement le nom du fichier en ligne de commande ; la seconde recherche l'entrée standard, qui est redirigée depuis le fichier vers stdin de `grep`.

Parfois, vous voulez qu'un filtre agisse sur une série de fichiers, dont l'un est l'entrée standard. De nombreuses commandes vous permettent d'utiliser `-` en ligne de commande comme un alias pour l'entrée standard. Exemple:

```
student@ant3814:~/COURS/FICHIERS$ grep 'GATTTGC' big_file.fasta bigger_file.fasta -
```
Cet exemple recherche "GATTTGC" à trois endroits. D'abord dans le fichier `big_file.fasta`, puis dans `bigger_file.fasta`, et enfin dans l'entrée standard (qui, puisqu'elle n'est pas redirigée, proviendra du clavier).

#### Entrées/Sorties Standards et Tubes (Pipes)

La chose la plus cool à propos du shell Unix est sa capacité à chaîner des commandes ensemble dans des mini-pipelines. Voici un exemple:

```
student@ant3814:~/COURS/FICHIERS$ grep 'GATTTGC' big_file.fasta | wc -l
4
```
Il y a deux commandes ici. `grep` recherche dans un fichier ou dans l'entrée standard les lignes contenant une chaîne particulière. Les lignes contenant la chaîne sont affichées sur la sortie standard. `wc -l` est le programme de comptage de mots familier, qui compte les mots, les lignes et les caractères dans un fichier ou dans l'entrée standard. L'option de ligne de commande `-l` indique à `wc` d'imprimer uniquement le nombre de lignes. Le caractère `|`, connu sous le nom de "tuyau" (pipe en anglais), connecte les deux commandes ensemble de sorte que la sortie standard de `grep` devienne l'entrée standard de `wc`. Pensez à des tuyaux connectant des flux de données en mouvement.

Que fait ce tuyau? Il affiche le nombre de lignes dans lesquelles la chaîne "GATTGC" apparaît dans le fichier `big_file.fasta`.

#### Autres Idiomes de Tubes (Pipes)

Les tubes sont très puissants. Voici quelques idiomes courants de la ligne de commande.

**Compter le Nombre de Fois qu'un Motif n'Apparaît pas dans un Fichier**

L'exemple en haut de cette section vous a montré comment compter le nombre de lignes dans lesquelles un motif de chaîne particulier apparaît dans un fichier. Que faire si vous voulez compter le nombre de lignes dans lesquelles un motif n'apparaît **pas**?

Simple. Inversez le test avec l'option `-v`:

```
student@ant3814:~/COURS/FICHIERS$ grep -v "GATTTGC" big_file.fasta | wc -l
53
```
**Extraire les lignes uniques d'un fichier**

Si vous avez une longue liste de noms dans un fichier texte et que vous voulez éliminer les doublons :

```
student@ant3814:~/COURS/FICHIERS$ sort long_file.txt | uniq > unique.out
```
Cela fonctionne en triant toutes les lignes par ordre alphabétique et en redirigeant le résultat vers le programme `uniq`, qui supprime les lignes dupliquées qui se suivent. C'est pourquoi vous devez d'abord trier. La sortie est placée dans un fichier nommé `unique.out`.

**Concaténer plusieurs listes et supprimer les doublons**

Si vous avez plusieurs listes qui pourraient contenir des entrées répétées entre elles, vous pouvez les combiner en une seule liste unique en les concaténant, puis en les triant et en extrayant les lignes uniques comme précédemment :

```
student@ant3814:~/COURS/FICHIERS$ cat file1 file2 file3 file4 | sort | uniq
```

**Compter les lignes uniques dans un fichier**

Si vous voulez simplement savoir combien il y a de lignes uniques dans le fichier, ajoutez un `wc` à la fin du tube :

```
student@ant3814:~/COURS/FICHIERS$ sort long_file.txt | uniq | wc -l
```
Vous pouvez également compter combien de copies de chaque ligne unique existent dans un ou plusieurs fichiers
```
student@ant3814:~/COURS/FICHIERS$ sort file1.txt file2.txt file3.txt file4.txt |uniq -c
```

**Parcourir une fichier vraiment longue**

Redirigez la sortie de `ls` vers le programme `less`, qui affiche une page à la fois.
```
student@ant3814:~/COURS/FICHIERS$ cat sample.vcf | less
```
si vous exécutez less sur un fichier qui a des lignes très longues, vous pouvez améliorer la visualisation avec l'option -S

```
student@ant3814:~/COURS/FICHIERS$ less -S sample.vcf
```

**Surveiller un fichier en croissance pour un motif**

Redirigez la sortie de `tail -f` (qui surveille un fichier en croissance et affiche les nouvelles lignes) vers `grep`. Par exemple, cela surveillera le fichier `/var/log/syslog` pour l'apparition d'e-mails adressés à 'student':

```
student@ant3814:~$ tail -f /var/log/syslog | grep student
```

### Permissions

Souvent, plusieurs utilisateurs différents travaillent sur le même ordinateur. Pour les aider à travailler sans se perturber mutuellement, un ensemble d'autorisations est attaché aux fichiers et répertoires. Ces autorisations permettent ou empêchent la lecture, l'écriture ou l'exécution d'un fichier. Il existe des autorisations pour l'utilisateur, le groupe et les autres. Vous pouvez voir les autorisations avec une commande `ls -l`.

```
dbrown@narval:~$ ls -l
total 16
drwx------+  3 dbrown  staff   96 Oct 15 14:09 Desktop
drwx------+  3 dbrown  staff   96 Oct 15 14:09 Documents
...
-rw-r--r--   1 dbrown  staff    9 Oct 15 14:12 expt1.countdata.tsv
-rw-r--r--   1 dbrown  staff   20 Oct 15 14:11 notes.txt
-rw-r--r--   1 dbrown  staff   23 Oct 16 13:37 print.py
```

La série de caractères au début de la ligne décrit les autorisations. Le premier caractère est

```
d (répertoire / directory), l pour lien, - pour fichier
```

Ensuite, il y a trois triples de caractères (- signifie non autorisé, une lettre signifie que vous avez l'autorisation de lire (read), écrire (write) et exécuter). x pour un répertoire signifie que vous pouvez accéder au répertoire.

```
rwx
```

pour utilisateur, groupe, autre (other), comme ceci

```
  Usr Grp Autr
d rwx rwx rwx
```

Les utilisateurs peuvent appartenir à des groupes (qui collaborent) et les autres sont tous les autres.

La commande `chmod` (changer le mode) modifie les autorisations. Vous ajoutez des autorisations avec `+` et les supprimez avec `-`

Vous pouvez modifier les autorisations pour l'utilisateur `u`, le groupe `g`, les autres `o` ou tous (all) `a`

Pour rendre le fichier print.py exécutable (c'est-à-dire exécutable comme un programme), vous écrivez

```
student@ant3814:~$ ls -l print.py 
-rw-r--r--  1 student  staff  23 Oct 16 13:37 print.py
student@ant3814:~$ chmod a+x print.py 
student@ant3814:~$ ls -l print.py 
-rwxr-xr-x  1 student  staff  23 Oct 16 13:37 print.py
student@ant3814:~$
```

Pour empêcher les autres de lire ou d'exécuter le script Python, vous écrivez

```
student@ant3814:~$ chmod o-rx print.py 
student@ant3814:~$ ls -l print.py 
-rwxr-x---  1 dbrown  staff  23 Oct 16 13:37 print.py
```

Pour convertir un script en un programme exécutable, vous devrez le rendre exécutable avec chmod, puis ajouter le répertoire actuel à votre PATH (nous verrons comment faire plus tard). Pour vous, vous pouvez taper la commande dans votre terminal.

```
export PATH=".:${PATH}"       # add '.', le répertoire actuel à la liste des chemins
                              # où le système d'exploitation recherche les programmes
rehash    # cela reconstruit l'ensemble des chemins pour l'interpréteur de commandes
```

<div style="page-break-after: always;"></div>  

### Plus de Unix

Voici quelques commandes Unix plus avancées qui sont très utiles, et lorsque vous aurez le temps, vous devriez les étudier plus en détail. Nous listons les numéros de page pour le Linux Phrasebook Deuxième Édition de Scott Granneman ou des liens vers des tutoriels en ligne.

 - `awk` (Linux Phrasebook p.194-198)([tutoriel en ligne](https://www.tutorialspoint.com/awk/index.htm))
 - `sed` (Linux Phrasebook p.188-194)([tutoriel en ligne](https://www.tutorialspoint.com/sed/index.htm))
 - `perl` one-liners ([tutoriel en ligne](https://catonmat.net/introduction-to-perl-one-liners))
 - boucles `for` ([tutoriel en ligne](https://www.tutorialspoint.com/unix/for-loop.htm))

---

### [Lien vers le problème Unix 1](problemsets/Unix_01_problemset.md)