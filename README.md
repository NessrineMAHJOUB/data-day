<!-- BEGIN_TF_DOCS -->
# Usages terraform

Initier le répértoire terraform :           terraform init \
Planification de l'execution des scripts :  terraform plan -var-file="./environment/dev.tfvars" \
Execution de la planification des scripts : terraform apply -var-file="./environment/dev.tfvars"

# Structure du script

```
├── environments/      # Folder contenant les variables d'environnement
│   ├── dev.tfvars       # Déclaraion des variables d'environnements spécifiques à l'environnement de dev
├── schemas/          # Schemas de données
├── modules/          # Modules terraform
│   ├── schema/          # Module liés aux schémas de données
│   │   ├── main.tf          # Execution principale du module
│   │   ├── variables.tf     # Définition des variables du module
│   │   ├── provider.tf      # Déclaration des crédentials requis pour les providers du module
│   │   ├── terraform.tf     # Déclaration des providers requis pour le module
│   ├── topic/             # Module liés aux topics kafka
│   │   ├── main.tf          # Execution principale du module
│   │   ├── variables.tf     # Définition des variables du module
│   │   ├── provider.tf      # Déclaration des crédentials requis pour les providers du module
│   │   ├── terraform.tf     # Déclaration des providers requis pour le module
├── main.tf          # Execution principale du script (1)
├── variables.tf     # Définition des variables du script
├── provider.tf      # Déclaration des crédentials requis pour les providers du script
├── terraform.tf     # Déclaration des providers requis pour le script
├── backend.tf       # Localisation du tfstate généré par l'éxécution (par default en local)
```

# Exercice
1. Compléter la ressource schema_registry_cluster dans le fichier (1)
2. Décommenter le module topic et compléter
	1. Remplir le fichier main.tf pour la création de deux topics. Ces topics devront être variabilisés sous forme d'une liste comprenant le nom et le nombre de partitions pour chacun.
	2. Configurer le provider au niveau du cluster
3. Créer le module schema
	1. Création de schémas liés au topics variabilisés sous forme de liste. Les nom de ces schémas devront être nommés ainsi <topic_name>-value ou <topic_name>-key pour le contenu ou la clé d'un message

## Conventions de nommage
topics  : <username>-topic
schemas : <topic_name>-value.avsc
          <topic_name>-key.avsc

## Schémas de données
Clé du message
```
{
    "fields": [
      {
        "name": "key",
        "type": "int"
      }
    ],
    "name": "test_key",
    "namespace": "fr.rs2i.test",
    "type": "record"
}
```

Valeur du message
```
{
    "fields": [
      {
        "name": "id",
        "type": "int"
      },
      {
        "name": "item",
        "type": "string"
      }
    ],
    "name": "test_key",
    "namespace": "fr.rs2i.test",
    "type": "record"
}
```