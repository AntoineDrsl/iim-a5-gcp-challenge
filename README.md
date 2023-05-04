# iim-a5-gcp-challenge

## Préparation de l'application

- Accéder au dossier src: ```cd src```
- Installer les dépendances: ```npm install```

## Lancement de l'application

- Accéder au dossier terraform: ```cd terraform```
- Commenter le bloc *backend* dans *main.tf*
- Initialiser terraform: ```terraform init```
- Appliquer les modifications: ```terraform apply```
- Pour utiliser un autre projet, passer l'argument ```-var="project_id=<PROJECT_ID>"```, même chose pour changer la région

- Si vous rencontrez une erreur "googleapi", attendez quelques secondes avant de relancer la commande. Si l'erreur persiste, activez l'API manuellement en suivant le lien indiqué dans l'erreur

## Sauvegarde des fichiers Terraform

- Décommenter le bloc *backend* dans *main.tf*
- Réinitialiser terraform pour stocker la configuration: ```terraform init -migrate-state```

## Modification du code en ligne

- Après avoir fait une modification dans le dossier src/, relancer ```terrraform apply``` pour mettre à jour la fonction

## Suppression de l'environnement

- Commenter le bloc *backend* dans *main.tf*
- Réinitialiser terraform: ```terraform init -migrate-state```
- Supprimer les éléments: ```terraform destroy```

## Auteur
Antoine Durussel