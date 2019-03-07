Raft est un protocole de consensus réparti

Le problème que cherche à résoudre Raft est comment gagner la bataille d'austerlitz ?
Napoleon a une armée avec des généraux et le pb est que lorsqu'il donne un ordre à un général, il faut que tous les généraux aient le même ordre.
Comment établir un consensus entre des entités qui ne se voient pas et qui peuvent uniquement échanger des messages.

l'empereur doit coordonner ses generaux, si seulement certains de ses généraux portent ses ordres, il perd tout,
l'empereur et ses généraux communiquent entre eux en utilisant des *messages* qui contient les ordres,
l'empereur donne un ordre à tout ses généraux, soit attaque, soit défend,
le but est de s'assurer qu'ils ont **tous** le même ordre lorsqu'on leur demande d'agir, c'est à dire qu'ils obtiennent un consensus.

Hypothèses dans l'échange entre l'empereur et les généraux
* Les messages sont fiables, c'est à dire que tous les messages sont livrés et que les généraux sont "parfaits"
* Les messagers ne sont pas fiables, ils peuvent être tués, divertis, les messages peuvent arriver dans le mauvais ordre.
* Les généraux peuvent être tués et ne plus répondre du tout, ou ils peuvent revenir et avoir été uste blessé,
* ou il y a un traitre, un des généraux diffuse de mauvais ordres

