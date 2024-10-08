# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

Boardgame.destroy_all

puts 'Creating Users'

User.create!(email: 'user@user.com', password: 'password', username: 'Sarkraf', first_name: 'Arnaud', last_name: 'Floriani', city:"Lille", age: 26, count: rand(18..40), rate: 0)
User.create!(email: 'owner@owner.com', password: 'password', username: 'Deedee_lab', first_name: 'Violette', last_name: 'Fayolle', city:"Lille", age: 28, count: rand(18..40), rate: 0)

User.create!(email: 'user1@user.com', password: 'password', username: 'LoneWolf', first_name: 'John', last_name: 'Doe', city:"Roubaix", age: 23, count: rand(18..40), rate: 0)
User.create!(email: 'user2@user.com', password: 'password', username: 'StarGazer', first_name: 'Jane', last_name: 'Smith', city:"Lomme", age: 26, count: rand(18..40), rate: 0)
User.create!(email: 'user3@user.com', password: 'password', username: 'MoonWalker', first_name: 'Alice', last_name: 'Brown', city:"Tourcoing", age: 28, count: rand(18..40), rate: 0)
User.create!(email: 'user4@user.com', password: 'password', username: 'ThunderBolt', first_name: 'Bob', last_name: 'Johnson', city:"Lille", age: 29, count: rand(18..40), rate: 0)
User.create!(email: 'user5@user.com', password: 'password', username: 'SilentShadow', first_name: 'Charlie', last_name: 'Williams', city:"Roubaix", age: 30, count: rand(18..40), rate: 0)
User.create!(email: 'user6@user.com', password: 'password', username: 'CrystalDream', first_name: 'Emily', last_name: 'Jones', city:"Lille", age: 28, count: rand(18..40), rate: 0)
User.create!(email: 'user7@user.com', password: 'password', username: 'SilverFox', first_name: 'Michael', last_name: 'Garcia', city:"Lomme", age: 39, count: rand(18..40), rate: 0)
User.create!(email: 'user8@user.com', password: 'password', username: 'WhisperWind', first_name: 'Sophia', last_name: 'Miller', city:"Wasquehal", age: 32, count: rand(18..40), rate: 0)
User.create!(email: 'user9@user.com', password: 'password', username: 'IronClad', first_name: 'Daniel', last_name: 'Davis', city:"Wasquehal", age: 33, count: rand(18..40), rate: 0)
User.create!(email: 'user10@user.com', password: 'password', username: 'PhoenixFlame', first_name: 'Isabella', last_name: 'Martinez', city:"Lille", age: 33, count: rand(18..40), rate: 0)

puts 'Users created'

puts 'Creating Events'

addresses = [
  "10 Rue des Arts, 59000 Lille, France",
  "25 Rue de la République, 59100 Roubaix, France",
  "7 Boulevard Carnot, 59160 Lille, France",
  "8 Rue de la Gare, 59140 Dunkerque, France",
  "14 Avenue du Général de Gaulle, 59700 Marcq-en-Barœul, France",
  "32 Rue du Faubourg de Roubaix, 59100 Roubaix, France",
  "5 Place Charles de Gaulle, 59000 Lille, France",
  "12 Rue de la Clef, 59100 Roubaix, France",
  "45 Boulevard de la Liberté, 59800 Lille, France",
  "19 Rue du Quesnoy, 59300 Valenciennes, France"
]

titles = [
  "Imagino-Party",
  "Sauve Qui Peut !",
  "Mécano-Showdown",
  "Quêtes et Légendes",
  "Romance et Ruses",
  "Pioche à Gogo",
  "Bâtisseurs en Folie",
  "Île aux Trésors",
  "Dé à la Mode",
  "Guerres et Récoltes"
]

descriptions = [
  "Plongez dans un univers où votre imagination est reine avec Dixit. Mais ce n’est pas tout, préparez-vous aussi à des intrigues romantiques avec Loveletter et des défis stratégiques avec Carcassonne !",
  "Le monde est en péril ! Formez votre équipe pour affronter Pandemic. Ensuite, testez votre coopération avec Saboteur et poursuivez la soirée avec l'exploration de Catane.",
  "Entrez dans une Europe alternative avec Scythe et montrez vos talents de stratège. Après cela, lancez-vous dans des quêtes épiques avec Pathfinder et terminez avec une conquête stratégique dans Catane.",
  "Vivez des aventures inoubliables avec Pathfinder. Ensuite, complotez avec Loveletter et construisez votre empire avec Carcassonne.",
  "Dans l’univers de Loveletter, séduisez la princesse tout en évitant les complots. Continuez avec des stratégies sournoises dans Saboteur et des combats épiques dans Scythe.",
  "Creusez, trahissez et trouvez de l'or dans Saboteur. Ensuite, défiez vos amis avec Yams et bâtissez des villes avec Carcassonne.",
  "Conquérez le monde médiéval avec Carcassonne. Continuez votre construction avec Catane et testez vos talents d'improvisation avec Dixit.",
  "Explorez et colonisez avec Catane. Puis, évitez les pandémies dans Pandemic et plongez dans l'univers fantastique de Pathfinder.",
  "Lancez les dés avec Yams pour décrocher la victoire ! Continuez avec des jeux de stratégie comme Scythe et Carcassonne.",
  "Battez-vous pour des ressources dans Scythe. Puis, développez votre empire agricole avec Catane et plongez dans une quête héroïque avec Pathfinder."
]

10.times do |i|
  Event.create!(
    title: titles[i],
    description: descriptions[i],
    address: addresses[i],
    date: (Date.today + rand(1..30)),
    time: Time.now.strftime("%H:%M"),
    capacity: rand(4..15),
    creator: User.all.sample  # Attribution d'un créateur aléatoire parmi les utilisateurs existants
  )
end
# passé
Event.create!(title: 'Soirée Yams & Raclette', description:   "Creusez, trahissez et trouvez de l'or dans Saboteur. Ensuite, défiez vos amis avec Yams et bâtissez des villes avec Carcassonne.", address: "2 Avenue des Saules, 59160 Lille, France", date: (Date.today - rand(1..30)), time: Time.new().strftime("%H:%M"), capacity: rand(1..15), creator: User.first)
# a venir
sleep(1)
event2 = Event.create!(title: 'Soirée de zinzin en perspective !', description:   "Le monde est en péril ! Formez votre équipe pour affronter Pandemic. Ensuite, testez votre coopération avec Saboteur et poursuivez la soirée avec l'exploration de Catane.", address: "12 Grande rue, 59100 Roubaix, France", date: (Date.today + rand(1..30)), time: Time.new().strftime("%H:%M"), capacity: rand(1..15), creator: User.last)

puts 'Events created'

puts 'Creating Inscriptions'

Inscription.create!(user: User.first, event: event2, comment: 'Comment 1', status: 'En attente')

# Récupération de tous les événements et utilisateurs
events = Event.all

# Pour chaque événement, créer un nombre aléatoire d inscriptions
events.each do |event|
  users = User.all.to_a
  # Nombre d'inscriptions pour cet événement (entre 1 et 5 par exemple)
  rand(1..5).times do
    user = users.delete_at(users.index(users.sample))
    Inscription.create!(
      user: user,            # Attribution d'un utilisateur aléatoire
      event: event,                  # L'événement auquel l'utilisateur s'inscrit
      comment: "Commentaire pour l'événement #{event.title}",  # Commentaire aléatoire
      status: ['En attente', 'Validée', 'Rejetée'].sample      # Statut aléatoire
    )
  end
end

puts 'Inscriptions created'

puts 'Creating Messages'

Message.create!(event: Event.last, user: User.first, content: 'Content 1')
Message.create!(event: Event.last, user: User.last, content: 'Content 2')

Event.all.each do |event|
  Message.create!(event: event, user: event.creator, content: 'Bonjour tout le monde !')
  event.inscriptions.each do |inscription|
    Message.create!(event: event, user: inscription.user, content: 'Hello')
  end
end

puts 'Messages created'

puts 'Creating Boardgames'

Boardgame.create(
  name: "Catan",
  description: "Dans Catan, les joueurs collectent des ressources et les utilisent pour construire des routes, des colonies et des villes.",
  image_url: "games/catan_banner.jpg",
  thumbnail_url: "games/boite_catan.jpg",
  min_players: 3,
  max_players: 4,
  playing_time: 60,
  age: 10,
  category: "Jeux de plateau",
  release_year: 1995,
  publisher: "Kosmos"
)

Boardgame.create(
  name: "Carcassonne",
  description: "Carcassonne est un jeu de pose de tuiles où les joueurs construisent des routes, des villes, et des cloîtres pour marquer des points.",
  image_url: "games/jeu_carcassonne.jpg",
  thumbnail_url: "games/boite_carcassonne.jpeg",
  min_players: 2,
  max_players: 5,
  playing_time: 35,
  age: 7,
  category: "Jeux de plateau",
  release_year: 2000,
  publisher: "Hans im Glück"
)

# board3 = Boardgame.create(
#   name: "Les Aventuriers du Rail",
#   description: "Un jeu de placement où les joueurs collectent des cartes de train pour construire des routes et relier des villes à travers l'Amérique du Nord.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 5,
#   playing_time: 60,
#   age: 8,
#   category: "Jeux de plateau",
#   release_year: 2004,
#   publisher: "Days of Wonder"
# )

# board4 = Boardgame.create(
#   name: "Terra Mystica",
#   description: "Terra Mystica est un jeu de stratégie de développement territorial où les joueurs incarnent différentes factions pour développer leurs territoires.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 5,
#   playing_time: 100,
#   age: 12,
#   category: "Jeux de plateau",
#   release_year: 2012,
#   publisher: "Feuerland Spiele"
# )

# Boardgame.create(
#   name: "Takenoko",
#   description: "Dans Takenoko, les joueurs cultivent un jardin pour nourrir un panda et faire pousser des bambous.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 4,
#   playing_time: 45,
#   age: 8,
#   category: "Jeux de plateau",
#   release_year: 2011,
#   publisher: "Bombyx"
# )

# Boardgame.create(
#   name: "Citadelles",
#   description: "Citadelles est un jeu de cartes où les joueurs incarnent des personnages pour construire la cité la plus prestigieuse.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 8,
#   playing_time: 60,
#   age: 10,
#   category: "Jeux de cartes",
#   release_year: 2000,
#   publisher: "Edge Entertainment"
# )

Boardgame.create(
  name: "Saboteur",
  description: "Saboteur est un jeu de cartes où les joueurs sont soit des mineurs creusant des tunnels vers l'or, soit des saboteurs tentant de les en empêcher.",
  image_url: "games/saboteur_banner.jpg",
  thumbnail_url: "games/boite_saboteur.jpeg",
  min_players: 3,
  max_players: 10,
  playing_time: 30,
  age: 8,
  category: "Jeux de cartes",
  release_year: 2004,
  publisher: "Amigo"
)

Boardgame.create(
  name: "Love Letter",
  description: "Love Letter est un jeu de cartes où les joueurs cherchent à faire parvenir une lettre d'amour à la princesse tout en déjouant les autres joueurs.",
  image_url: "games/jeu_love_letter.jpeg",
  thumbnail_url: "games/boite_love_letter.jpg",
  min_players: 2,
  max_players: 4,
  playing_time: 20,
  age: 10,
  category: "Jeux de cartes",
  release_year: 2012,
  publisher: "Z-Man Games"
)

# Boardgame.create(
#   name: "The Crew",
#   description: "The Crew est un jeu de cartes coopératif où les joueurs accomplissent des missions en jouant des plis pour réussir des objectifs.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 5,
#   playing_time: 20,
#   age: 10,
#   category: "Jeux de cartes",
#   release_year: 2019,
#   publisher: "Kosmos"
# )

# Boardgame.create(
#   name: "6 Qui Prend !",
#   description: "6 Qui Prend ! est un jeu de cartes où les joueurs doivent éviter de ramasser des cartes de bœufs en plaçant judicieusement leurs cartes numérotées.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 10,
#   playing_time: 45,
#   age: 8,
#   category: "Jeux de cartes",
#   release_year: 1994,
#   publisher: "Amigo"
# )

# Boardgame.create(
#   name: "L'Appel de Cthulhu",
#   description: "L'Appel de Cthulhu est un jeu de rôle d'horreur où les joueurs incarnent des investigateurs explorant des mystères occultes inspirés des œuvres de H.P. Lovecraft.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 6,
#   playing_time: 240,
#   age: 12,
#   category: "Jeux de rôle",
#   release_year: 1981,
#   publisher: "Chaosium"
# )

# Boardgame.create(
#   name: "Donjons & Dragons",
#   description: "Donjons & Dragons est le jeu de rôle emblématique où les joueurs incarnent des personnages dans un univers médiéval fantastique.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 10,
#   playing_time: 240,
#   age: 12,
#   category: "Jeux de rôle",
#   release_year: 1974,
#   publisher: "Wizards of the Coast"
# )

# Boardgame.create(
#   name: "Vampire : La Mascarade",
#   description: "Vampire : La Mascarade est un jeu de rôle où les joueurs incarnent des vampires luttant pour survivre et dominer un monde sombre et gothique.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 6,
#   playing_time: 240,
#   age: 18,
#   category: "Jeux de rôle",
#   release_year: 1991,
#   publisher: "White Wolf"
# )

Boardgame.create(
  name: "Pathfinder",
  description: "Pathfinder est un jeu de rôle qui propose un système évolué basé sur les règles de Donjons & Dragons avec un univers riche et varié.",
  image_url: "games/jeu_pathfinder.jpg",
  thumbnail_url: "games/boite_pathfinder.jpg",
  min_players: 2,
  max_players: 6,
  playing_time: 240,
  age: 12,
  category: "Jeux de rôle",
  release_year: 2009,
  publisher: "Paizo Publishing"
)

# Boardgame.create(
#   name: "L'Anneau Unique",
#   description: "L'Anneau Unique est un jeu de rôle se déroulant dans l'univers de J.R.R. Tolkien, où les joueurs incarnent des héros affrontant les forces du mal en Terre du Milieu.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 6,
#   playing_time: 240,
#   age: 12,
#   category: "Jeux de rôle",
#   release_year: 2011,
#   publisher: "Cubicle 7"
#   )

#   Boardgame.create(
#   name: "Terraforming Mars",
#   description: "Dans Terraforming Mars, les joueurs dirigent des corporations pour transformer la planète Mars en un endroit habitable.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 1,
#   max_players: 5,
#   playing_time: 120,
#   age: 12,
#   category: "Jeux de stratégie",
#   release_year: 2016,
#   publisher: "FryxGames"
# )

Boardgame.create(
  name: "Scythe",
  description: "Scythe est un jeu de stratégie où les joueurs développent leur territoire, produisent des ressources, et déploient des mechs dans une Europe alternative des années 1920.",
  image_url: "games/jeu_scythe.jpg",
  thumbnail_url: "games/boite_scythe.jpg",
  min_players: 1,
  max_players: 7,
  playing_time: 115,
  age: 14,
  category: "Jeux de stratégie",
  release_year: 2016,
  publisher: "Stonemaier Games"
)

# Boardgame.create(
#   name: "Twilight Imperium",
#   description: "Twilight Imperium est un jeu de stratégie épique où les joueurs dirigent des empires galactiques pour conquérir la galaxie.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 3,
#   max_players: 6,
#   playing_time: 240,
#   age: 14,
#   category: "Jeux de stratégie",
#   release_year: 1997,
#   publisher: "Fantasy Flight Games"
# )

# Boardgame.create(
#   name: "Agricola",
#   description: "Dans Agricola, les joueurs développent leur ferme, cultivent des champs, et élèvent des animaux pour nourrir leur famille.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 1,
#   max_players: 5,
#   playing_time: 120,
#   age: 12,
#   category: "Jeux de stratégie",
#   release_year: 2007,
#   publisher: "Lookout Games"
# )

# Boardgame.create(
#   name: "Brass: Birmingham",
#   description: "Brass: Birmingham est un jeu de stratégie économique où les joueurs construisent des industries et développent des réseaux de transport en Angleterre pendant la révolution industrielle.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 4,
#   playing_time: 120,
#   age: 14,
#   category: "Jeux de stratégie",
#   release_year: 2018,
#   publisher: "Roxley Games"
# )

Boardgame.create(
  name: "Pandemic",
  description: "Pandemic est un jeu coopératif où les joueurs doivent collaborer pour éradiquer des maladies qui menacent l'humanité.",
  image_url: "games/pandemic_banner.jpg",
  thumbnail_url: "games/boite_pandemic.jpg",
  min_players: 2,
  max_players: 4,
  playing_time: 45,
  age: 8,
  category: "Jeux de coopération",
  release_year: 2008,
  publisher: "Z-Man Games"
)

Boardgame.create(
  name: "Hanabi",
  description: "Hanabi est un jeu coopératif de cartes où les joueurs doivent créer un magnifique feu d'artifice en plaçant les cartes dans le bon ordre sans voir leur propre main.",
  image_url: "games/hanibi_banner.jpg",
  thumbnail_url: "games/boite_hanibi.jpg",
  min_players: 2,
  max_players: 5,
  playing_time: 25,
  age: 8,
  category: "Jeux de coopération",
  release_year: 2010,
  publisher: "Abacusspiele"
)

# Boardgame.create(
#   name: "Ghost Stories",
#   description: "Ghost Stories est un jeu coopératif où les joueurs doivent défendre un village contre des hordes de fantômes en utilisant des pouvoirs spéciaux.",
#   image_url: "https://cf.geekdo-images.com/opengraph/img/ElEP8P6VexAmPb3XPl1CpM6evxg=/fit-in/1200x630/pic1223630.jpg",
#   thumbnail_url: "https://cf.geekdo-images.com/thumb/img/8lzMQqvHLZ9LpaJdp1n-SCn6k_w=/fit-in/200x150/pic1223630.jpg",
#   min_players: 1,
#   max_players: 4,
#   playing_time: 60,
#   age: 12,
#   category: "Jeux de coopération",
#   release_year: 2008,
#   publisher: "Repos Production"
# )

# Boardgame.create(
#   name: "Le Seigneur des Anneaux",
#   description: "Le Seigneur des Anneaux est un jeu coopératif où les joueurs incarnent les hobbits de la Communauté, cherchant à détruire l'Anneau Unique tout en résistant aux forces de Sauron.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 5,
#   playing_time: 90,
#   age: 12,
#   category: "Jeux de coopération",
#   release_year: 2000,
#   publisher: "Kosmos"
# )

# Boardgame.create(
#   name: "Unlock!",
#   description: "Unlock! est un jeu coopératif qui simule une expérience d'escape room où les joueurs résolvent des énigmes pour s'échapper d'une situation donnée.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 6,
#   playing_time: 60,
#   age: 10,
#   category: "Jeux de coopération",
#   release_year: 2017,
#   publisher: "Space Cowboys"
# )

# Boardgame.create(
#   name: "King of Tokyo",
#   description: "Dans King of Tokyo, les joueurs incarnent des monstres géants qui se battent pour le contrôle de Tokyo en lançant des dés pour attaquer, soigner et améliorer leurs capacités.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 6,
#   playing_time: 30,
#   age: 8,
#   category: "Jeux de dés",
#   release_year: 2011,
#   publisher: "Iello"
# )

Boardgame.create(
  name: "Yams (Yahtzee)",
  description: "Yahtzee est un jeu de dés classique où les joueurs lancent des dés pour réaliser différentes combinaisons et marquer des points.",
  image_url: "games/banner_yams.jpg",
  thumbnail_url: "games/boite_yams.jpg",
  min_players: 1,
  max_players: 10,
  playing_time: 30,
  age: 8,
  category: "Jeux de dés",
  release_year: 1956,
  publisher: "Milton Bradley"
)

# Boardgame.create(
#   name: "Qwixx",
#   description: "Qwixx est un jeu de dés rapide où les joueurs cochent des cases sur leur feuille en fonction des résultats des dés, cherchant à marquer le plus de points possible.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 5,
#   playing_time: 15,
#   age: 8,
#   category: "Jeux de dés",
#   release_year: 2012,
#   publisher: "Nürnberger-Spielkarten-Verlag"
# )

# Boardgame.create(
#   name: "Zombie Dice",
#   description: "Dans Zombie Dice, les joueurs incarnent des zombies cherchant à manger autant de cerveaux que possible en lançant des dés, mais doivent éviter les balles.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 8,
#   playing_time: 20,
#   age: 8,
#   category: "Jeux de dés",
#   release_year: 2010,
#   publisher: "Steve Jackson Games"
# )

# Boardgame.create(
#   name: "Monopoly Junior",
#   description: "Monopoly Junior est une version simplifiée du classique Monopoly, adaptée aux enfants avec des règles plus simples et des pièces de jeu amusantes.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 4,
#   playing_time: 45,
#   age: 5,
#   category: "Jeux de société pour enfants",
#   release_year: 1990,
#   publisher: "Hasbro"
# )

Boardgame.create(
  name: "Dixit",
  description: "Dixit est un jeu de société créatif où les joueurs utilisent des cartes illustrées pour faire deviner des mots ou phrases aux autres joueurs.",
  image_url: "games/Dixit_banner.jpg",
  thumbnail_url: "games/boite_dixit.jpg",
  min_players: 3,
  max_players: 6,
  playing_time: 30,
  age: 8,
  category: "Jeux d'ambiance",
  release_year: 2008,
  publisher: "Libellud"
)

# Boardgame.create(
#   name: "Grouch Couch",
#   description: "Grouch Couch est un jeu amusant pour les enfants où ils doivent accomplir des missions et collecter des jetons tout en évitant les obstacles.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 2,
#   max_players: 4,
#   playing_time: 30,
#   age: 5,
#   category: "Jeux de société pour enfants",
#   release_year: 2016,
#   publisher: "Hasbro"
# )

# Boardgame.create(
#   name: "Le Verger",
#   description: "Le Verger est un jeu coopératif simple pour les jeunes enfants où les joueurs travaillent ensemble pour récolter des fruits avant que les corbeaux ne les mangent.",
#   image_url: "boardgame_mates_banner.jpg",
#   thumbnail_url: "boardgame_mates_banner.jpg",
#   min_players: 1,
#   max_players: 4,
#   playing_time: 15,
#   age: 3,
#   category: "Jeux de société pour enfants",
#   release_year: 1989,
#   publisher: "Haba"
# )


puts 'Boardgames created'

puts 'Creating Boardgames_lists'

# 4.times do
#   BoardgamesList.create!(event: Event.first, boardgame: Boardgame.all.sample)
# end

Event.all.each do |event|
  event.boardgames = Boardgame.all.sample(rand(1..6))
end

puts 'Boardgames_lists created'


puts "Mise au point pour pitch"

User.find_by(username: 'Sarkraf').my_events.destroy_all
User.find_by(username: 'Sarkraf').events.destroy_all

Event.find_by(city: "Dunkerque").update(creator: User.find_by(username: 'Deedee_lab'))
