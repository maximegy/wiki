# Préparation d'un déploiement sur GKE
Par exemple une application servlet JAVA déployée sur Tomcat
On se connecte au shell
On exporte des variables d'environnement:
```bash
export PROJ="nomduprojet"
export ZONE="nomdelazone"
gcloud config set projet nomduprojet
```

on crée un répertoire
```bash
mkdir kubejava
cd kubejava
```

on prépare le servlet, on le compile et on l'exporte en tant que war
webTestApp.java:
```java
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            String name=request.getParameter("name");
            if (name==null)
                name="unknown";
            PrintWriter writer = response.getWriter();
            writer.print("Hello "+name+" it's "+new Date());
            System.out.println("got call from "+name);
            writer.flush();
        }
```

## Creation des containers
L'application sera installée en mode Sidecar: un premier container contiendra Tomcat et sa configuration et un deuxième container contiendra le war à déployer. Ainsi on pourra mettre à jour le war indépendamment de Tomcat et vice versa.

on crée un répertoire
```bash
mkdir kubejava
cd kubejava
```
### Tomcat
on crée le docker file
```bash
vi Dockerfile
```
```Dockerfile
FROM tomcat:7
```
On construit l'image
```bash
sudo docker build -t areg/tomcat7:1 .
```
Lancer le container pour voir s'il fonctionne
```bash
sudo docker run -p 8080:8080 areg/mytomcat:1
```

Tagger l'image pour la preparer pour Google Container Registry
```bash
sudo docker tag areg/tomcat7:1 gcr.io/$PROJ/tomcat7:1
gcloud docker -- push gcr.io/$PROJ/tomcat7:1
```

### Java
```bash
cd ..
mkdir webapps-image
cd webapps-image
cp ../kubejava/webTestApp.war ./
vi Dockerfile
```
```Dockerfile
FROM Alpine
RUN apk add --no-cache bash
ADD WebTestApp.war webapps/WebTestApp.war
CMD "tail" "-f" "/dev/null"
```
```bash
sudo docker build -t areg/webapps:1 .
sudo docker tag areg/webapps:1 gcr.io/$PROJ/webapps:1
```

## Création du Cluster sur GKE
```bash
// verify $ZONE variable and configure Zone
echo $ZONE
gcloud config set compute/zone $ZONE

// Create small 2 nodes cluster
gcloud container clusters create ksmall --num-nodes 2 --zone $ZONE --machine-type g1-small
```

## Préparation du Deployment
```bash
cd ..
vi mywebapp-deploy.yaml
```
```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: mywebapp-deploy
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: mywebapp
    spec:
      containers:
      - image: gcr.io/nomduprojet/webapps:1
        name: webapps
        lifecycle:
          postStart:
            exec:
              command:
                - "sh"
                - "-c"
                - >
                  touch /var/log/preparation_start ;
                  /bin/cp -rf /webapps/* /apps/ 
        volumeMounts:
          - mountPath: /apps
            name: app-volume
      - image: gcr.io/nomduprojet/tomcat7:1
        name: tomcat
        volumeMounts:
          - mountPath: /usr/local/tomcat/webapps
            name: app-volume
        ports:
        - containerPort: 8080
      volumes:
      - name: app-volume
        emptyDir: {}
```

## Préparation du Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mywebapp-service
  labels:
    app: mywebapp
spec:
  ports:
    - port: 8080
    type: LoadBalancer
    sessionAffinity: ClientIP # une fois qu'une ip s'est connecté, elle reste sur le même pod
    selector:
      app: mywebapp
```


## 