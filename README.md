# ZigzagScanASM


Pour ce troisième projet, nous vous demandons d’implémenter le zigzag scan.
JPEG (acronyme de Joint Photographic Experts Group) est une norme qui définit le format d’enregistrement et l’algorithme de décodage pour une représentation numérique compressée d’une image
fixe.
L’image est découpée en blocs de 64 (8 × 8) pixels. L’information de luminosité est conservée telle
quelle (8 ×8 pixels dans l’image d’origine) et pour les couleurs, les blocs sont sous-échantillonnés (8 ×8,
16 × 8 ou 16 × 16 pixels dans l’image d’origine).
Il est alors appliqué à chaque bloc la transformée de DCT (Discrete Cosine Transform, variante de la
transformée de Fourier). Pour ça il faut voir un bloc comme une fonction à deux variables (les indices
de position dans la matrice) qui va pouvoir être décomposée en une somme de fonctions cosinus
oscillantes à des fréquences différentes par la transformée DCT. Chaque bloc est ainsi décrit en une
carte de fréquences et amplitudes au lieu de pixels et coefficients de couleur/luminosité.


Ensuite, a lieu l’étape de quantification qui consiste à diviser la matrice résultante de la transformée
DCT par une autre, appelée matrice de quantification, et qui contient (8 × 8) coefficients fixes qui sont
choisis lors de l’implémentation. Voici un exemple de matrice obtenue après l’étape de quantification:


La quantification ramène plusieurs coefficients à 0. Ce sont surtout les coefficients en bas à droite
qui finissent à 0 alors que ceux en haut à gauche sont généralement préservés. Ceci s’explique par le
fait que les hautes fréquences contribuent peu à l’image.
C’est alors qu’arrive l’étape qui concerne ce projet, le scan en zigzag. Le scan en zigzag a pour but
de représenter notre bloc 8 × 8 sous la forme d’un vecteur dont les premières valeurs correspondent
aux coefficients des fréquences les plus représentées (les basses fréquences) et à la fin se trouvent les
coefficients des basses fréquences qui sont le plus souvent à 0. Le scan en zigzag commence donc au
coin supérieur gauche (0, 0) et se termine au coin inférieur droit (7, 7) de la table. Le parcours s’effectue
comme le montre la figure suivante.


Pour ce projet, deux fichiers sont fournis. Le template de zigzag_scan.cpp contenant les seuls
include autorisés et le début de la fonction main(). Et un makefile avec la liste des flags qu’il faut
fournir à g++.
Si les signatures des fonctions ne sont pas scrupuleusement respectées (en ce inclus les noms des
arguments donnés) ou si les fichiers n’ont pas tous les noms demandés, le projet sera sanctionné d’un
0/20.
