<!-- TITLE: Python - Administration -->
<!-- SUBTITLE: A quick summary of Administration -->

# Liens GitHub
https://github.com/packetracer

# Fabric
Fabric est une bibliothèque simplifiant les tâches d'administration. Alors que Chef et Puppet sont plus adaptés à la gestion des serveurs et des bibliothèques système, Fabric est plus sur les tâches de niveau applicatif comme le déploiement.
Pour installer Fabric: `pip install fabric`.

Le code suivant va créer deux tâches : `memory_usage` et `deploy`.
* le premier va afficher l'utilisation mémoire de chaque machine,
* le second va se connecter en SSH à la machine, cd vers le dossier du projet, activer l'environnement, pull la dernière version du code et redémarrer l'application.

```python
from fabric.api import cd, env, prefix, run, task

env.hosts = ['server1', 'server2']

@task
def memory_usage():
  run('free -m')

@task
def deploy():
  with cd('var/www/project-env/project'):
    with prefix('. ../bin/activate'):
      run('git pull')
      run('touch app.wsgi')
```

Le dossier sauvegardé dans le fichier `fabfile.py`, on va pouvoir vérifier l'utilisation mémire avec `fab memory_usage`:

```batchfile
$ fab memory_usage
[server1] Executing task 'memory'
[server1] run: free -m
[server1] out:              total     used     free   shared  buffers   cached
[server1] out: Mem:          6964     1897     5067        0      166      222
[server1] out: -/+ buffers/cache:     1509     5455
[server1] out: Swap:            0        0        0

[server2] Executing task 'memory'
[server2] run: free -m
[server2] out:              total     used     free   shared  buffers   cached
[server2] out: Mem:          1666      902      764        0      180      572
[server2] out: -/+ buffers/cache:      148     1517
[server2] out: Swap:          895        1      894
```






# Psutil





# Salt


# Ansible

# Chef


# Terraform


# Vagrant


# Puppet

