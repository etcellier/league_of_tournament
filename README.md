# League of Tournament

League of Tournament est une application web développée avec Ruby on Rails qui permet de gérer des tournois de League of Legends. Cette plateforme facilite l'organisation des équipes, des joueurs et des matchs.

## Fonctionnalités

- **Gestion des équipes**: Créer, afficher, modifier et supprimer des équipes (maximum 5 joueurs par équipe)
- **Gestion des joueurs**: Ajouter des joueurs avec leur pseudo et rôle (Top laner, Jungler, Mid laner, ADC, Support)
- **Gestion des matchs**: Programmer des matchs entre équipes et enregistrer les résultats
- **Visualisation**: Afficher les statistiques, les informations détaillées des équipes et joueurs
- **Système d'authentification**: Interface d'administration réservée aux administrateurs

## Modèles

### Équipe (Team)
- `name`: Nom unique de l'équipe
- Relations: Une équipe peut avoir jusqu'à 5 joueurs

### Joueur (Player)
- `username`: Pseudo unique du joueur
- `role`: Rôle du joueur (Top laner, Jungler, Mid laner, ADC, Support)
- Relations: Un joueur appartient à une équipe

### Match (Match)
- `date`: Date et heure du match
- `score_team1`, `score_team2`: Scores des équipes
- Relations: Un match oppose deux équipes (team1 et team2)

### Utilisateur (User)
- `email`: Email unique de l'utilisateur
- `password_digest`: Mot de passe crypté
- `admin`: Booléen pour les droits d'administration

## Installation

1. Cloner le dépôt
   ```
   git clone [url-du-dépôt]
   cd league_of_tournament
   ```

2. Installer les dépendances
   ```
   bundle install
   ```

3. Configurer la base de données
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Démarrer le serveur
   ```
   rails server
   ```

5. Accéder à l'application dans votre navigateur
   ```
   http://localhost:3000
   ```

## Compte administrateur par défaut

Un compte administrateur est créé par défaut lors du seeding :
- Email: admin@example.com
- Mot de passe: password123

## Dépendances

- Ruby 3.3.0
- Rails 7.1.0
- PostgreSQL
- BCrypt pour l'authentification
- Tailwind CSS pour l'interface utilisateur

## Développement

Le projet utilise l'architecture MVC (Modèle-Vue-Contrôleur) standard de Rails avec :
- Validations pour s'assurer que les équipes n'ont pas plus de 5 joueurs
- Validation des rôles des joueurs
- Protection des routes d'administration

## Auteur

CELLIER Etienne
MARTINELLI Nicolas