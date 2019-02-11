<!-- TITLE: Mettre en place un vpn openvpn -->
<!-- SUBTITLE: A quick summary of Mettreenplaceunvpnopenvpn -->

# Configuration du Serveur
# Wizard
VPN > OpenVPN > Wizard.
Type of Server: local user access

## CA et Server Cert

| Paramètre         | Value                   | Description                                               |
| ----------------- | ----------------------- | --------------------------------------------------------- |
| Descriptive Name  | OpenVPN CA<br />OpenVPN | Un nom servant à référencer l'authorité de Certification. |
| Key length        | 2048 bit                | Taille de la clé qui va être générée                      |
| Lifetime          | 3650                    | durée de vie en jours                                     |
| Country code      | FR                      | Code de pays                                              |
| State or Province | MP                      | Région                                                    |
| City              | TLS                     | Ville                                                     |
| Organization      | le-cercle               | Nom de l'entreprise, du groupe.                           |

## Server Setup
### General OpenVPN Server Information

| Paramètre   | Value                | Description                                                              |
| ----------- | -------------------- | ------------------------------------------------------------------------ |
| Interface   | WAN                  | L'interface sur laquelle OpenVPN va écouter pour les sessions entrantes. |
| Protocol    | UDP on IPv4 only     | Protocole utilisé pour les connections OpenVPN.                          |
| Local Port  | 1194                 | Le port local sur lequel OpenVPN va écouter.                             |
| Description | nomad OpenVPN Server | Description du serveur                                                   |

### Cryptographic Settings

| Paramètre             | Value       | Description                                                             |
| --------------------- | ----------- | ----------------------------------------------------------------------- |
| TLS Authentication    | OK          | Active l'authentification des paquets TLS                               |
| Generate TLS Key      | OK          | Le Wizard va générer une clé d'authentification TLS automatiquement     |
| DH Parameters Length  | 2048 bit    | Longueur de la clé d'échange Diffie-Hellman (DH).                       |
| Encryption Algorithm  | AES-256-CBC | L'algorithme utilisé pour chiffrer le trafic entre les hôtes            |
| Auth Digest Algorithm | SHA256      | La méthode utilisée pour autentifier le traffic entre les hôtes         |
| Hardware Crypto       | NOK         | Pour utiliser l'accélaration matériel pour chiffrer les connections VPN |


### Tunnel Settings

| Paramètre                  | Value           | Description                                                                 |
| -------------------------- | --------------- | --------------------------------------------------------------------------- |
| Tunnel Network             | 10.0.8.0/24     | Le réseau virtuel utilisé pour les échanges entre le serveur et le client.  |
| Redirect Gateway           | OK              | Forcer les clients à sortir sur Internet par le serveur.                    |
| Local Network              | 172.16.1.0/24   | Le réseau qui sera accessible depuis le client distant.                     |
| Concurrent Connections     | 1               | Le nombre maximum d'utilisateurs pouvant se connecter simultanément.        |
| Compression                | Omit Preference | Utiliser l'algorythme LZO pour compresser les paquets traversant le tunnel. |
| Type-of-Service            | NOK             | Réutiliser la valeur TOS/DSCP du paquet entrant sur le paquet sortant.      |
| Inter-Client Communication | NOK             | Autoriser la communication entre les clients connectés à ce serveur.        |
| Duplicate Connections      | NOK             | Autoriser plusieurs connections venant de clients utilisant le même nom.    |


### Client Settings

| Paramètre          | Value | Description                                                                                                                                   |
| ------------------ | ----- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Dynamic IP         | OK    | Autoriser les clients connectés à maintenir leur connection si leur IP a changé.                                                              |
| Topology           | net30 | Spécifie la méthode utilisée pour attribuer des IP aux clients au sein du tunnel<br />(un sous réseau pour tous ou un sous réseau isolé hôte) |
| DNS Default Domain | X     | Domaine par défaut à envoyer aux clients.                                                                                                     |
| DNS Server 1,2,3,4 | X     | Serveurs DNS à envoyer aux clients.                                                                                                           |
| NTP Server         | X     | Serveur de temps à envoyer aux clients.                                                                                                       |
| Netbios            | X     | Configuration Netbios à envoyer aux clients                                                                                                   |
| WINS               | X     | Serveurs WINS à envoyer aux clients                                                                                                           |

## Step 10
Cocher la case Firewall Rule de la section "Traffic from client to server" pour ajouter une règle permettant les connections à ce serveur OpenVPN depuis les clients sur Internet.
Cocher la case OpenVPN rule de la section "Traffic from clients through VPN" pour ajouter une règle permettant le traffic des clients connectés à passer dans le tunnel.

## Editer le serveur OpenVPN
Cocher la case "Force DNS cache update" dans la section "Advanced Client Settings" pour forcer la mise à jour du cache DNS à la connection au VPN.

## Configuration des utilisateurs
Il faut maintenant ajouter des utilisateurs autorisés à se connecter au VPN.
Chaque utilisateur possède son certificat généré à sa création.

Pour créer un utilisateur, aller dans System > User Manager > Users puis cliquer sur "ADD" 

| Paramètre             | Value          | Description                                                          |
| --------------------- | -------------- | -------------------------------------------------------------------- |
| Disabled              | NOK            | D&sactiver l'utilisateur.                                            |
| Username              | Something      | Identifiant d'utilisateur.                                           |
| Password/ Confirm     | Something      | Longueur de la clé d'échange Diffie-Hellman (DH).                    |
| Expiration Date       | X              | Date d'expiration du compte.                                         |
| Custom settings       | NOK            | Utiliser des paramètres personnalisés pour le GUI et les dashboards. |
| Group membership      | X              | Exclure ou inclure dans des groupes.                                 |
| Certificate           | OK             | Génerer un certificat à la création de l'utilisateur.                |
| Descriptive Name      | user OVPN Cert | Nom du certificat.                                                   |
| Certificate authority | OpenVPN CA     | Autorité de certification.                                           |
| Key length            | 2048 bits      | Longueur de la clé.                                                  |
| Lifetime              | 3650           | Durée de vie de la clé.                                              |

## Exporter la configuration utilisateur
Pour exporter les configurations utilisateurs, il faut ajouter le paquet "openvpn-client-export".
System > Package Manager > Available Packages.
Dans VPN > OpenVPN > Client Export. Descendre jusque "OpenVPN Clients".
Choisir la configuration correspondante. Pour OpenVPN client sur Windows, choisir "Bundled Configurations" > "Archive".

# Installer OpenVPN
Télécharger OpenVPN depuis le lien suivant: https://openvpn.net/community-downloads/
L'installer et le lancer.
Extraire le dossier contenu dans l'archive dans `C:\Users\VotreUtilisateur\OpenVPN\config\`.
Modifier avec un editeur de texte le fichier `.ovpn` et modifier la ligne `remote X.X.X.X 1194 udp` et remplacer l'adresse IP par l'IP publique ou le nom ddns.

# Se connecter
dans la barre des tâches, afficher les icônes cachées, cliquer droit sur l'icône OpenVPN et cliquer sur "connecter". Entrer le login et le mot de passe de l'utilisateur et cliquer OK, la fenêtre disparait dès que la connexion est initiée. L'icône OpenVPN devient verte.