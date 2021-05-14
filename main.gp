\\default(parisizemax, 100m);
str2ascii(s) = Vec(Vecsmall(s));
ascii2str(v) = Strchr(v);


u27 = ffgen( ('x^3-'x+1)* Mod(1,3),'u );
codf27(s) = [ if( c==32, 0, u27^(c-97) ) | c<-str2ascii(s), c==32 || 97 <= c && c <= 122 ];


\\ Z/27Z d'après l'énoncé (alphabet et 'espace')

taille_alphabet = 27;
bloc_size = 40;

\\ Décodage : u inconnu,
\\ couteux en mémoire, il faut  stocker la table de codage.


table = [0..26];
for( i=1, 26, table[i] = (u27)^table[i] );
table[27]=0;                                \\ 'espace' est codé sur 0

\\ Décodage : identifier selon la table. Long mais constant.

decodf27(c) = {
    my( res = vector(#c) );
    for(i = 1, #c,
      for(j=1, 27,
        if( c[i] == table[j],
            res[i] = j;
        )
      );
    );
    for( i=1, #res,
		  if(res[i] == 0,
			   res[i] = 32,
		  res[i] += 96)
	  );
    ascii2str(res);
}

entree = read("input.txt");
texte1 = entree[1];
texte2 = entree[2];
nb = entree[3];


mauvais_chiffre = codf27(texte1);
bon_chiffre = codf27(texte2);



\\ Création de la matrice de transition.

mat_create(taille, u) = {
  mat = matrix(taille, taille, i, j, if( j == i+1, 1, 0) );
  mat[taille, 1] = -u;
  mat[taille, 2] = -1;
  mat;
}

\\On inverse la matrice; on déchiffre.

mat_inv(matrice) = {
  matrice = matrice^(-1);
  matrice;
}


m = mat_create(bloc_size, u27);
m = mat_inv(m);


\\ On met la matrice de transition à la puissance souhaité.
\\ Pour l'exercice, c'est puissance n = 929583887302112.

mat_power(matrice, puiss) = {
  if(puiss == 0,
    return ( matid(matsize(matrice)[1])) );

  if(puiss == 1,
    return (matrice) );

  if(puiss % 2 == 0,
    return ( mat_power(matrice^2,  puiss / 2) ),

  return ( matrice * mat_power(matrice^2, (puiss - 1) / 2) ));

}

\\ Ça ne fonctionne pas, les puissances sont trop grandes.
\\ On peut factoriser n pour simplifier.

mat_power2(matrice, puiss) = {
  exposants = factor(puiss);

  for(i = 1, matsize(exposants)[1],
    matrice = (mat_power(matrice, exposants[i, 1] ^ exposants[i, 2]));
  );
  matrice;
}



clef = mat_power2(m, nb);

\\ Obligé de lift, sinon avec la bonne clef et le bon chiffré, ça ne fonctionne pas. ENFIIIIIIIIIIIIIIN !!!!!!!!!

bon_chiffre = bon_chiffre~;
clair = clef * bon_chiffre;
print(decodf27(clair));
