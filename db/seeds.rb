# Création des équipes
team1 = Team.create!(name: "Karmine Corp")
team2 = Team.create!(name: "G2 Esports")
team3 = Team.create!(name: "Fnatic")
team4 = Team.create!(name: "Moviestar KOI")

# Création des joueurs pour chaque équipe
# Équipe 1
Player.create!(username: "Canna", role: "Toplaner", team: team1)
Player.create!(username: "Yike", role: "Jungler", team: team1)
Player.create!(username: "Vladi", role: "Midlaner", team: team1)
Player.create!(username: "Caliste", role: "ADC", team: team1)
Player.create!(username: "Targamas", role: "Support", team: team1)

# Équipe 2
Player.create!(username: "BrokenBlade", role: "Toplaner", team: team2)
Player.create!(username: "Skewmond", role: "Jungler", team: team2)
Player.create!(username: "Caps", role: "Midlaner", team: team2)
Player.create!(username: "Hans Sama", role: "ADC", team: team2)
Player.create!(username: "Labrov", role: "Support", team: team2)

# Équipe 3
Player.create!(username: "Oscarinin", role: "Toplaner", team: team3)
Player.create!(username: "Razork", role: "Jungler", team: team3)
Player.create!(username: "Humanoid", role: "Midlaner", team: team3)
Player.create!(username: "Upset", role: "ADC", team: team3)
Player.create!(username: "Mikyx", role: "Support", team: team3)

# Équipe 4
Player.create!(username: "Myrwnn", role: "Toplaner", team: team4)
Player.create!(username: "Elyoya", role: "Jungler", team: team4)
Player.create!(username: "Jojopyun", role: "Midlaner", team: team4)
Player.create!(username: "Supa", role: "ADC", team: team4)
Player.create!(username: "Alvaro", role: "Support", team: team4)

# Création de quelques matchs
# Match joué
Match.create!(
  date: DateTime.now - 2.days,
  team1: team1,
  team2: team2,
  score_team1: 3,
  score_team2: 1
)

Match.create!(
  date: DateTime.now - 1.day,
  team1: team3,
  team2: team4,
  score_team1: 2,
  score_team2: 2
)

# Match à venir
Match.create!(
  date: DateTime.now + 1.day,
  team1: team1,
  team2: team3
)

Match.create!(
  date: DateTime.now + 2.days,
  team1: team2,
  team2: team4
)

Match.create!(
  date: DateTime.now + 3.days,
  team1: team1,
  team2: team4
)

puts "Seeds completed successfully!"