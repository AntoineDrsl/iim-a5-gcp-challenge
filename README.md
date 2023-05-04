# iim-a5-gcp-challenge

## Lancement de l'application

- Accéder au dossier terraform: ```cd terraform```
- Commenter le bloc *backend* dans *main.tf*
- Initialiser terraform: ```terraform init```
- Appliquer les modifications: ```terraform apply```

## Sauvegarde des fichiers Terraform
- Décommenter le bloc *backend* dans *main.tf*
- Réinitialiser terraform pour stocker la configuration: ```terraform init -migrate-state```

## Modification du code en ligne
- Après avoir fait une modification dans le dossier src/, relancer ```terrraform apply``` pour mettre à jour la fonction

## Suppression de l'environnement
- Commenter le bloc *backend* dans *main.tf*
- Réinitialiser terraform: ```terraform init -migrate-state```
- Supprimer les éléments: ```terraform destroy```