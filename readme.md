# Démarches :

Se renseigner sur la logique des comics

## Entité :

- vérifier si le champ est légitime et logique par rapport aux relations, aux autres entités et la logique métier
- vérifier si le type de champ convient au nom du champ

## Relation :

- vérifier la logique dans les 2 sens de la relation si elle correspond à la logique métier
- vérifier si la relation peut être null (0,x) par rapport à la logique métier

# Choix :

## Règles de gestion :

### Relation editeurs - comics
- Un éditeur peut éditer entre 0 (lors de l'ajout d'un éditeur, il aura 0 comics attribué, il faudra ensuite le lier à un comics.) et n comics. (0,n)
- Un comics est édité par 1 (un comics à forcement un éditeur lors de l'ajout) et 1 seul éditeur. (1,1)

D'après mes recherches, aucuns comics n'a qu'un seul éditeur, dans le cas où il pourrait en avoir 2 ou plus dans le futur, il faudrait ajouter une table jointure.

### Relation recompenses - comics
- Une récompense peut appartenir à 0 (lors de l'ajout de la récompense, il n'y aura pas de comics attribué, il faudra le lier ensuite à un comics depuis la page d'un comics.) ou 1 seul comics. (1,1)
- Un comics peut recevoir entre 0 (lors de l'ajout d'un comics, il n'y aura pas forcément de récompense attribuée.) et n recompense (0,n)

D'après mes recherches une récompense est obtenu par un seul comics, dans le cas où il pourrait en avoir 2 ou plus dans le futur, il faudrait ajouter une table jointure.

### Relation epoques - comics
- Une époque peut posséder entre 0 (lors de l'ajout d'une époque, aucuns comics n'y seront attribués.) et n comics. (0,n)
- Un comics appartient à 1 (un comics appartient forcément à une époque lors de l'ajout.) et 1 seul époque. (1,1)

### Relation personnages - comics
- Un personnage peut être présent dans entre 0 (lors de l'ajout d'un personnage, il est présent dans aucuns comics.) et n comics. (0,n)
- Un comics peut contenir entre 1 (lors de l'ajout d'un comics, au minimum, 1 personnage doit être présent.) et n personnages. (1,n)

### Relation univers - comics
- Un univers peut contenir entre 0 (lors de l'ajout d'un univers, il n'y aura pas de comics attribué.) et n comics. (0,n)
- Un comics peut se passer dans 1 (un comics se passe forcément dans un univers.) et 1 seul univers. (1,1)

D'après mes recherches un comics se passe dans uniquement 1 univers, dans le cas où il pourrait en avoir 2 ou plus dans le futur, il faudrait ajouter une table jointure.

### Relation series - comics
- Une série de comics contient entre 0 (lors de l'ajout d'une série, il n'y a pas de comics attribué.) et n comics. (0,n)
- Un comics appartient, a entre 0 (Un comics n'appartient pas forcément a une série (Exemple : hors-série)) et 1 série (0,1)

### Relation collection - comics
- Une collection de comics contient entre 0 (lors de l'ajout d'une collection, il n'y a pas de comics attribué.) et n comics.
- Un comics appartient à 1 (un comics appartient forcément à une collection.) et 1 seul collection.

D'après mes recherches un comics n'appartient qu'à 1 collection, dans le cas où il pourrait en avoir 2 ou plus dans le futur, il faudrait ajouter une table jointure.

## Champs supprimés :

- NombreDeVolumes(Table : Series) : pour moi, ce champ correspond au nombre de comics contenus dans la série. Ce champ peut être calculé dans une requête (Exemple : SELECT COUNT(\*) FROM Comics WHERE Id_series = x)

## Champs modifiés :

- Les champs Resume (Table : Comics), Descriptif (Table : Series), Description (Table : Recompenses) sont passés de VARCHAR a TEXT : varchar a permet de stocker des textes court alors que text permet de stocker des textes longs, d'après le nom des champs, text correspond mieux et est plus futureproof.
- Les champs AnneeParution (Table : Series) et AnneeObtenue (Table : Recompenses) sont passés de DATETIME à YEAR : le mois, le jour et l'heure ne sont pas nécessaires d'après le nom des champs.
- Les champs PremiereApparition (Table : Personnages), DateParution (Table : Collections), DatePublication (Table : Comics) sont passés de DATETIME à DATE : l'heure n'est pas nécessaire d'après le nom des champs.

## Tables ajoutées :

### Dessinateurs :

- Un dessinateur peut dessiner entre 0 (lors de l'ajout d'un dessinateur, il n'y a pas de comics attribué.) et n comics. (0,n)
- Un comics peut être dessiné par 1 et 1 seul dessinateur. (1,1)

D'après mes recherches un comics n'a qu'un seul dessinateur, dans le cas où il pourrait en avoir 2 ou plus dans le futur, il faudrait ajouter une table jointure.

### Scénaristes :

- Un scénariste peut écrire entre 0 (lors de l'ajout d'un scénariste, il n'y a pas de comics attribué.) et n comics. (0,n)
- Un comics est écrit par 1 et 1 seul scénariste. (1,1)

D'après mes recherches un comics n'a qu'un seul scénariste, dans le cas où il pourrait en avoir 2 ou plus dans le futur, il faudrait ajouter une table jointure.

## Autres observations :

- Le champ "Statut" de la table "Personnages" : la définition de statut d'un personnage pour moi, c'est "mort" ou "vivant", si c'est bien la bonne définition, un personnage peut être vivant dans un comics et mort dans un autre, du coup, il faudrait mettre le statut du personnage dans la relation entre personnage et comics

- Le champ "Prestige" de la table "Collections" : la définition de prestige d'une collection pour moi, c'est un booléen qui dit si la collection est une collection prestige, si c'est bien la bonne définition, il faudrait changer le type du champ.
