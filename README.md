# One time pad

## Problème

> Adèle, c'est toi ?
> > Ah, Basile, dépêche toi ! il me faut les infos.

> Oui, je t'envoie ça. Canal habituel ?
> > Surtout pas ! il a été compromis, on se replie sur le plan B.

> Oulah, j'ai oublié ce truc, c'est quoi déjà ?
> > Pas très compliqué, il faut surtout que tu retrouves les paramètres. On a
> > fait l'échange au début de la mission.

> Attends voir... Voilà, clef secrète : j'ai un entier ``n``,
> le et polynôme ``x^40+x+u`` sur ``F27=F3[u]/u^3-u+1``.
> > C'est ça. Ben prends ton message, c'est une suite d'entiers, tu appliques
> > la récurrence du polynôme autant de fois qu'indiqué et tu m'envoies le
> > résultat. Je ferai pareil en sens inverse.

> OK. Vu que mon message c'est des lettres, j'envoie l'espace sur 0 et
> les lettres ``a=0..z=25`` sur ``u^0.. u^25`` pour le générateur ``u``,
> ça me donne un bloc de longueur 40 et le chiffré est
> ```
> lkttoafqagecglgkflpanbgkacwudnvnxreaspmx
> ```
> > Merci, je déchiffre...
> > Attends, c'est n'importe quoi. Tu as fait le bon
> > nombre d'itérations ?

> Je pense, oui : n=929583887302112, je t'ai transmis les indices n+i...
> ah pardon, j'ai compris, en fait c'est le bloc précédent, je t'ai transmis
> les (n-40)+i. Donc en fait le chiffré est
> ```
> snpmmgzhfsqrmevdkajq hvxxnixufdeiheiurgq
> ```
> > OK, c'est bon ! C'était pas la peine de renvoyer, au passage...


## Format

Vous devez écrire un programme `main.gp` en Pari/GP dont l'exécution via
```
gp -fq < main.gp
```
affiche (uniquement) la solution cherchée.

taper `make check` permet de vérifier que votre solution est bonne.

Veillez à mettre des commentaires sur votre démarche et sa validité
dans le fichier ``main.gp``.

De manière alternative, vous pouvez écrire un programme `main.c` qui
fasse la même chose.

## Validation

Il reste à faire un commit et à envoyer votre solution pour l'enregistrer
```
git add main.gp
git commit -m 'ma solution'
git push
```

