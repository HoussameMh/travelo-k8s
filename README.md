# Travelo sur Kubernetes

Manifests Kubernetes de l'application Travelo (React, Spring Boot, MySQL), déployée dans le namespace `travelo` d'un cluster Minikube.
Devoir 2 du module « Conteneurisation des Applications » (ASEDS, INPT, 2026/2027).

## Contenu

| Fichier | Objets |
|---|---|
| `k8s/00-namespace.yaml` | Namespace `travelo` |
| `k8s/01-quotas.yaml` | LimitRange (par Pod / conteneur) et ResourceQuota (namespace) |
| `k8s/02-rbac.yaml` | ServiceAccount `travelo-dev`, Role `travelo-developer`, RoleBinding |
| `k8s/03-config.yaml` | ConfigMap `travelo-config` |
| `k8s/03-secret.yaml.example` | Modèle du Secret `travelo-secret` (le vrai fichier n'est pas versionné) |
| `k8s/04-database.yaml` | Service headless + StatefulSet MySQL 8.4 |
| `k8s/05-backend.yaml` | Service + Deployment Spring Boot (2 réplicas) |
| `k8s/06-frontend.yaml` | Service + Deployment React / Nginx (2 réplicas) |
| `k8s/07-pdb.yaml` | PodDisruptionBudget backend et frontend |
| `k8s/08-ingress.yaml` | Ingress `frontend.exam.local` et `backend.exam.local` |
| `k8s/09-seed.yaml` | Job qui insère des vols de test |
| `demo/liveness-demo.yaml` | Pod de démonstration de la liveness probe |

## Déploiement

```powershell
minikube start --driver=docker --cpus=2 --memory=3072
minikube addons enable ingress

git clone https://github.com/<utilisateur>/travelo-k8s.git
cd travelo-k8s
Copy-Item k8s/03-secret.yaml.example k8s/03-secret.yaml   # puis changer les mots de passe
kubectl apply -f k8s/
kubectl get all -n travelo
```

Ajouter au fichier `C:\Windows\System32\drivers\etc\hosts` :

```
127.0.0.1 frontend.exam.local
127.0.0.1 backend.exam.local
```

Puis lancer `minikube tunnel` et ouvrir http://frontend.exam.local.

Images utilisées : `houssamemh/travelo-backend:1.0.4`, `houssamemh/travelo-frontend:1.0.1` (Docker Hub), `mysql:8.4`.
