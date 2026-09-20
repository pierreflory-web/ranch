# Le Ranch

Jeu d'élevage quotidien pour le lanceur « Mes Jeux » (web / PWA, mobile d'abord).
Chaque joueur a son ranch du Far West : il nourrit ses animaux **chaque jour**,
ramasse leur récolte (œufs, lait, laine…) qui rapporte des pièces 🪙 du lanceur,
et agrandit son enclos.

## La boucle du jour

1. Chaque animal a faim → on le touche pour le nourrir 🌾 (biberon 🍼 pour les bébés).
2. Il donne sa récolte → on la ramasse : +🪙 (pièces partagées avec le lanceur).
3. Tous soignés → « Ranch soigné » : points via `MesJeux.award('ranch', …)`
   (première victoire du jour plein tarif, défi du jour compatible).

## Le contenu

- **Panneau** : l'enfant nomme son ranch (modifiable via la boutique ou en touchant le panneau).
- **Boutique** : animaux (poule 15 🪙 → cheval 130 🪙, gains +1 → +6 🪙/jour),
  agrandissements d'enclos (4 → 8 → 12 → 16 places), graines de potager, et
  décorations à poser soi-même dans le grand pré (achats multiples).
- **Potager** : jusqu'à 4 carrés ; arroser 💧 chaque jour, récolter au bout de 2 à 4 jours.
- **Bébés animaux** : avec 2 adultes de la même espèce, une naissance environ une fois
  par mois (tirage quotidien déterministe + délai de 20 jours) ; le bébé grandit en 3 jours.
- **Commande du saloon** 📜 : une commande par jour tirée des animaux possédés ;
  livrer la récolte du jour rapporte des points (`MesJeux.award('saloon', …)`).
- **Événement du jour** (même tirage pour toute la famille) : renard 🦊 à chasser
  (3 touches, +10 🪙), marchand ambulant (récoltes doublées), pluie 🌧️ qui arrose
  le potager, trèfle 🍀 caché dans le grand pré (+8 🪙), ou jour des câlins 💝
  (+1 🪙 par câlin, 5 au maximum).
- **Visites** 👋 : voir le ranch des autres joueurs (lecture seule) et laisser un ❤️
  par jour ; le propriétaire est prévenu à sa prochaine visite.
- **Saisons et heure** : ciel du soir, nuit étoilée (21 h – 7 h, animaux endormis),
  citrouilles en octobre, neige en hiver, fleurs au printemps… automatique selon la date.

## Sauvegarde

- Joueur connecté sur « Mes Jeux » : colonne `ranch` (jsonb) de la table `players`
  (voir `ranch.sql`, à exécuter une fois dans Supabase) + les pièces `coins` partagées.
- Sinon : localStorage de l'appareil (bourse locale de départ : 40 🪙).

## Intégration lanceur

- `points.js` : badges `fermier` (premier soin) et `eleveur` (8 animaux),
  défi du jour « ranch », gains via `award('ranch')` et `award('saloon')`.
- Carte ajoutée au tableau `GAMES` de `jeux/index.html`.

## Lancer en local

```bash
python3 -m http.server 8642
```

puis ouvrir http://localhost:8642/ranch/ (mode « invité » : sauvegarde locale).
