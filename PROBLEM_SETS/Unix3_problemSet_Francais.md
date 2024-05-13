1) Dans le fichier [nobody.txt](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/nobody.txt), trouvez chaque occurrence de "Nobody" et imprimez la ligne. Faites d'abord cela avec ```grep```, puis avec une expression régulière perl.

2) Dans le fichier [nobody.txt](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/nobody.txt), remplacez chaque occurrence de 'Nobody' par votre nom préféré et écrivez un fichier de sortie avec le nom de cette personne (par exemple, Michael.txt).

3) En utilisant des expressions régulières, trouvez toutes les lignes d'en-tête FASTA dans [unix3.fasta](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/unix3.fasta). Notez que le format pour un en-tête dans un fichier FASTA est une ligne qui commence par un symbole supérieur à et est suivie de quelques textes (par exemple,  `>nomSeq description` où nomSeq est le nom ou l'identifiant de la séquence. L'identifiant ne peut pas contenir d'espaces. La description qui suit peut contenir des espaces.)

4) Si une ligne correspond au format d'un en-tête FASTA, extrayez le nom de la séquence et la description en utilisant des sous-modèles (groupes).
    -   Imprimez les informations de séquence dans ce format:  `id:nomSeq desc:descriptionSeq`

5) L'enzyme ApoI a un site de restriction : R^AATTY où R et Y sont des nucléotides dégénérés. Recherchez sur Google les codes IUPAC pour identifier les possibilités de nucléotides pour R et Y. Écrivez une expression régulière pour trouver et imprimer toutes les lignes du site dans la séquence suivante  [apoI.fasta](https://raw.githubusercontent.com/nomascus/ANT3814/main/FILES/apol.fasta).

6) GTTGCCTGAAATGGCGGAACCTTGAA fait 27 nucléotides de long, ce qui signifie qu'il devrait être composé de 9 codons. Utilisez des expressions régulières pour diviser cela en 9 codons séparés d'abord par des tabulations, puis par des sauts de ligne. Indice : vous devrez utiliser un quantificateur et un sous-modèle.
