ossir
clusif
club27001

podcasts:
no-limit sécu
comptoir sécu

ISC StormCast

# Première Partie
## 1 Nous mourrons tous un jour
* Heartbleed: haaaa l'Internet va exploser, on va tous mourrir
* Shellshock: au secours, gros pb dans bash, on va tous mourrir
* Spectre / Meltdown: on a eu un accident nucléaire majeur il y a 20 et on vient de réaliser. Bonne chance les enfants:
    Exfiltration de données
      * Vulnérabilité existe probablement depuis 1995
      * Programme userland
      * Exploitation optimisation micro-processeurs
      (réordonnancement spéculatif instructions) > attaque temporelle (timing attack) sur cache micro-processeur
      * Accès indirect (canal caché) à mémoire protégée
      * spectre: espace noyau rattaché au processus
      * Meltdown: mémoire d'autres processus.
    Le plus drôle:
      * tout systeme pouvant ececuter du code non controle est vulnérable
      * Navigateurs: exploitation possible vi javascript > attention ou vous surfez!
      * Téléphones portable: navigateur apps maleveillantes etc
      * Systèmes mutualisés: processus client peut lire la mémoire de tous les autres processus
      Machines virtuelles:
        Meltdown permet à un processus dans une VM de lire la mémoire d'autres VM sur le même hyperviseur.
    Solutions:
        Jeter les procs? mais quels remplaçants ? > processeurs pré 1995 ^^
        Correctifs noyau, dégradation possible performances
        Correctifs micro-code processeurs à déployer
        Déjà Que
            Correctifs logiciels pas toujours installés (objets connectés, smartphones...), espérer proc rapidemment mis à jour très optimiste > probleme va rester longtemps
        Mais c'est pas fini:
            Déplacement investigations sécurité vers micro-code (périphériques, processeurs) > début découvertes vulnérabilités matérielles.

## 2 Entre applications
Gmail, tout le monde connaît
- service de courrier électronique financé par la disparition de votre vie privée,
- Cadre mondial,
- Une spécificité: agnostique sur les points :
  toto@gmail.com et t.oto...@gmail.com correspondent à la même boîte de réception.
- C'est pas du standard mais on est Google.
Faire des fantaisies avec un standard peut se révéler dangereux, directement ou non.
Netflix
- Service de vidéo a la demande,
- Mondial, payant,
- Compte associé à une adresse mail et carte bancaire
- Respecte l'usage normal pour l'adresse

Deux services distincts, sans rapports entre eux,
Chacun, indépendemment, fonctionne correctement
Mais si on les combine bien...

j'identifie un compte netflix associé adresse GMAIL
Je vais créer un compte avec variation d'adresse
association carte bancaire jetable
plus qu'à attendre
possible déclancher opération validation CB.

## 3 Codons mal
le code est a la base de tout
Setuid: le processus n'appartient pas à l'utilisateur qui l'a lancé mais au propriétaire de l'exécutable
Setgid: même chose, pour le groupe,
Permet de donner accès à une fonction "protégée".
Exemple passwd est setuid root, pour pouvoir modifier le fichier /etc/shadow
Une constante universelle:
  Processus privilégié + erreur de codage/de conception = risque élévation locale de privilèges.



ssh ouvert:
mdp
certificats
portknocker

mod sec
naxsi
relais inverse
waf