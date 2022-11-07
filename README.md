# Examen pour Cours Décalés

Ce projet en mono-repo est écrit en TypeScript et est divisé en 3 sous-repos:
- Application react (@sample/app): packages/app
- Composants react (@sample/components): packages/components
- Serveur react (@sample/server): packages/server

## Travail demandé

### Gitlab

Créer un projet Gitlab public et cloner dessus le projet de l'examen.

### Dockerfile

Lire les scripts dans les fichiers package.json et générer des fichiers Dockerfile pour chaque sous-repo.

### Jenkinsfile

Générer un fichier Jenkinsfile qui permet de réaliser les étapes suivates:
1) Auth: s'authentier sur Dockehub
2) App: tester, générer une image Docker pour l'application react et faire le push sur Dockherhub uniquement en cas de changement du sous-repo
3) Components: tester, générer une image Docker pour les composants react et faire le push sur Dockherhub uniquement en cas de changement du sous-repo
3) Server: tester, générer une image Docker pour le serveur react et faire le push sur Dockherhub uniquement en cas de changement du sous-repo
4) CleanUp: se déconnecter de DockerHub et effacer les images Docker locales

## Travail à rendre

Dans Google Classroom, rendre votre lien GitLab public contenant le Jenkinsfile et les Dockerfile.
Ajouter un fichier doc contenant les captures d'écrans de l'execution de vos pipelines sur Jenkins.