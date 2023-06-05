<div align="center">

<br/>

**Samuel Cossette**

<br/><br/>

**Rapport suivi 1**

<br/><br/>

**Travail présenté à**

**Nicolas Bourré**

<br/><br/>

**Cégep de Shawinigan**

**31 mai 2023**

</div>

---

<br>

# Table des matières

- [Introduction](#introduction)
- [Explication Projet](#explication-projet)
- [Explication Fonctionnalité](#explication-fonctionnalité)
- [Conclusion](#conclusion)
- [Référence / Médiagraphie](#référence--médiagraphie)

<br>

# Introduction

<div align="justify">

Depuis la révolution technologique du 20ème siècle, d’innombrables nouvelles activités ont lentement émergé dans la société. Ces activités, principalement des loisirs, sont devenues des portes d'entrée vers le monde professionnel. Les jeux vidéo en sont un exemple.

Les jeux vidéo n'ont pas toujours été populaires depuis leur invention. En effet, leur popularité a augmenté grâce aux jeux classiques et simplistes d'arcade tels que Pac-Man ou encore Galaga. Depuis leur importante évolution, l'industrie a apporté de nombreux progrès, permettant la création de jeux tels que Mario Kart, Zelda, CSGO, Valorant, Minecraft, etc. Avec la continuation de cette envolée technologique dans le domaine, les dix dernières années ont contribué à développer une nouvelle technologie : la réalité virtuelle. La réalité virtuelle est un environnement stimulant qui offre à l'utilisateur une expérience 3D immersive.

Aujourd'hui, la réalité virtuelle est utilisée dans de nombreuses industries, notamment dans les jeux vidéo, la formation professionnelle, l'immobilier, la médecine et même dans l'industrie du tourisme. Les jeux vidéo sont probablement les applications les plus populaires de la réalité virtuelle, mais il existe également des applications sérieuses qui permettent aux professionnels de s'entraîner dans des environnements virtuels sans risque, d'explorer des sites immobiliers ou de visualiser des procédures médicales complexes.

Bien que la VR soit encore relativement nouvelle et en constante évolution, elle offre un potentiel incroyable pour améliorer la façon dont nous interagissons avec le monde numérique et peut-être même avec le monde réel

<br>

</div>

# Explication Projet

<div align="justify">

Mon projet consiste à développer un jeu vidéo dans Godot 4.0 qui utilise la génération procédurale et la réalité virtuelle (VR). Ainsi, mon projet combine ces deux aspects pour offrir une expérience de jeu unique et immersive. La génération procédurale garantit que chaque partie du jeu est différente. La réalité virtuelle ajoute une couche d'immersion supplémentaire en permettant aux joueurs de vivre le jeu de manière plus réaliste et interactive. En résumé, mon projet consiste à développer un jeu vidéo qui utilise la génération procédurale pour créer du contenu de manière algorithmique, et qui exploite la réalité virtuelle pour offrir aux joueurs une expérience immersive et interactive.

<br>

</div>

# Explication Fonctionnalité

<div align="justify">

La vr :

La génération procédurale : 
Le premier script est une classe appelée "Chunk" qui étend la classe Node3D. Il crée des morceaux de terrain en utilisant un bruit généré par la variable "noise". Le terrain est généré sous forme de maillage en utilisant un objet PlaneMesh. Les sommets du maillage sont modifiés en fonction du bruit généré, ce qui crée des variations de hauteur. Le maillage est ensuite utilisé pour créer une instance de MeshInstance3D, qui est ajoutée comme enfant de la scène. De plus, le script génère également de l'eau en utilisant un autre objet PlaneMesh et l'ajoute également comme enfant de la scène.
Le deuxième script étend la classe Node3D et gère la génération dynamique de morceaux de terrain (chunks). Il utilise un bruit généré par l'objet FastNoiseLite pour générer les variations de terrain. Les chunks sont créés en fonction de la position du joueur et sont ajoutés à la scène lorsque nécessaire. Les chunks qui ne sont plus nécessaires sont supprimés pour optimiser les performances. Le script maintient une liste des chunks générés et utilise des dictionnaires pour gérer leur ajout, suppression et réinitialisation.
<br>

<div>

# Conclusion

<div align="justify">

<br>

<div>

# Référence / Médiagraphie
