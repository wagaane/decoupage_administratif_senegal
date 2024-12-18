# decoupage_administratif_senegal

`decoupage_administratif_senegal` est un package Flutter permettant d'accéder aux données du découpage administratif du Sénégal. 
Ce package fournit une base de données SQLite contenant des informations sur les **régions**, **départements**, **villes**, 
**communes** et **quartiers**, du pays.

## Fonctionnalités

Ce dépendance permet l'accès aux données administratives : régions, départements, villes, communes et quartier du Sénégal. 
Ainsi, grace aux donnée administratives stockées dans une base de données `SQLite`, il est possible :
- D'avoir la liste  des regions, départements, villes, communes et quartier du sénégal.
- D'avoir la liste des département d'une régions donnée.
- D'avoir la liste des communes d'un département donnée.
- D'avoir la liste des quartiers d'une commune donnée.
- De Faire des recherche poussées selon le nom d'une region, d'un département, d'une ville, d'une commune ou d'un quartier donné.

La liste est longue. De ce fait ne manquer pas de faire le tour afin de découvrir toutes les fonctionlités et ainsi en faire 
bon usage dans vos projets future.

Le tout est modelé avec une facilité d'intégration dans des applications Flutter pour la gestion des données administratives.

## Installation

Ajoutez la dépendance suivante dans votre fichier `pubspec.yaml` :

```yaml
dependencies:
  decoupage_administratif_senegal: ^0.0.3
```


## Utilisation
- Importation

```dart
import 'package:decoupage_administratif_senegal/db/queries.dart';

```

- Exemple d'utilsation

```dart
// Recupèration de l'ensemble des régions
var regions = await Queries.getRegions();

// Recupèration d'une région via son id
int id = 1;
var region = await Queries.getRegionById(id);

// Recupèration d'une région via son code
String code = 'R1'; // code region : R1, R2, R3 ...
var region = await Queries.getRegionById(code);

// Recupératioin départements via id région
int idRegion = 2;
var departments = await Queries.getDepartmentById(idRegion);

```


## Note
Il est important de faire une étude du fichier assets/decoupage.db, afin de 
faire une visualisation globale des données pour une meilleure prise en main.