# Kubernetes

Mot d'origine grecque signifiant "timonier", celui qui gouverne la barre du bateau,
Solution Open Source origine de Google puis maintenu par CNCF
Inspiré du projet Borg dont Google se sert en interne depuis des années,
développé avec des partenaires: Red Hat, CoreOS, IBM, Microsoft, Mesosphere, VMWare, HP...
écrit en Go,
peut tourner en local, sur le cloud (GCE, AWS, Azure), sur des machines physiques.
Kuernetes REST API
L'objectif est de gérer directement des applications et non plus des machines.

# Que permet Kubernetes
Déployer une application sous forme de containers rapidement et de manière prévisible, 
Automatiser le déploiement et la réplication de containers,
Optimiser les containers en groupes et faire du Load Balancing,
Déclarer l'architecture cible (nombre de pods, contenu, stratégie de mise à jour, ...) et laisser le système travailler à maintenir cette cible,
Faire des mises à jour sans interruption de service,
Séparer l'application de l'architecture sous-jacente,
Détecter les problèmes et les résoudre tout seul,

# Concepts

`Cluster` : ensemble de machines physique ou virtuelle sur utilisé par Kubernetes pour faire tourner des applications
`Node` : machine physique ou virtuelle sur laquelle des Pods vont pouvoir être déployées
`Namespace` : permet de segmenter Pods, volumes, secrets ...
`kubectl` : application en ligne de commande permettant d'interragir avec Kubernetes

## Pod
Groupe de containers déployés ensemble
Les containers du pod:
* sont toujours démarrés, arrêtés ou répliqués en groupe,
* Partagent le même network namespace (même IP et ports),
* Peuvent communiquer ensemble en utilisant localhost,
* Peuvent partager des données via les Shared Volumes.

```bash
// create a pod
kubectl create -f mypod.yml

// list all pods
kubectl get pods

// delete a pod
kubectl delete mydeploy-219439254324-b04g6
```

## Volume
Un volume est un espace de stockage qui peut être attaché à un container, peut être persité indépendemment du conteneur et peut être attaché à plusieurs container du pod en même temps.

## Deployment
Element central de kubernetes, c'est ici qu'on défini l'infrastructure cible:
- les containers à mettre dans le pod,
- les détails de réplication,
- la stratégie de mise à jour,
- etc

Le `deployment controller` va se charger de maintenir cet état.
Par exemple, un pod plante, le controller va s'en rendre compte, le désactiver, l'enlever du load balancer comme cible et en redéployer un.

## Service
Permet d'accéder à une série de Pods via une même IP statique,
Pods identifiés par un label (selector),
Peut faire du Load Balancing,
Différents types:
* ClusterIP
* NodePort
* LoadBalancer

```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    run: mydeploy
  name: mydeploy
  namespace: default
spec:
  clusterIP: 10.3.249.220
  ports:
  - nodePort: 31994
    ports: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    run: mydeploy
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer:
    ingress:
    - ip: 104.154.32.162
```

## Secret et ConfigMap
Composants Kubernetes
Passer des informations sensibles ou de configuration au Pod,
Trop de développeurs mettent des détails de configuration ou même des passwords dans un conteneur et le publient sur dockerhub

Utilise rdes Secret et des ConfigMap qui seront montés dans le container en tant que volumes au démarrage

### Config map
Créer un dossier et mettre les fichiers de propriétés et créer la configmap
```bash
mkdir config-webtestapp
cd config-webtestapp
kubectl create configmap myconfigmap --from-file=config-webtestapp
```

modifier le deployment config et ajouter en volume:
```yaml
spec:
template:
    spec:
      containers:
      (...)
      - image : toto/hello-worl:1
        name: toto
        volumeMounts:
          - mountPath: /usr/local/tomcat/webapps
            name: app-volume
          - mountPath: /config/WebTestApp
            name: config-volume
        ports:
          - containerPort: 8080
      volumes:
      - name: app-volume
        emptyDir: {}
      - name: config-volume
        configMap:
          name: myconfigmap
```

en les fichiers seront donc mis à disposition dans le conteneur dans /config/WebTestApp

## Requêtes et limitations de resources

```yaml
(...)
    containers:
    - image: toto/apache:1
      name: webapps
      resources:
        requests:
          cpu: 10m
    - image: toto/tomcat:2
      name: tomcat
      resources:
        limits:
          cpu: 250m
          memory: 250Mi
(...)
```

## Montée en charge

Manuel:
```bash
kubectl scale deployment mywebapp-deploy --replicas=2
```
Automatique:




Automatisation de tout ça avec HELM, Jenkins etc.



## dashboard

gcloud container clusters describe ksmall
kubectl proxy --port=8081