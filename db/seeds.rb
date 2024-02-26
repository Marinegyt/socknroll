# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "2319, on a un 2319!"
Sock.destroy_all
User.destroy_all
Request.destroy_all
puts "Chaussettes détruites!"
puts "Utilisateurs détruits!"
puts "Requêtes détruites!"

puts "Création de nouveaux utilisateurs..."
@user_marine = User.create!(first_name: "Marine", last_name: "Gayet", address: "4 Rue des céramistes, 64000 Pau", email: "marinegayet@gmail.com", password: "123456")
@user_perrine = User.create!(first_name: "Perrine", last_name: "Guerrapin", address: "331 Avenue des buveurs de café, 22240 Plurien", email: "perrine.guerrapin@gmail.com", password: "123456")
@user_cedric = User.create!(first_name: "Cédric", last_name: "Mingam", address: "2bis Allée des pères de famille, 71210 Le Marmot", email: "truc1@truc.com", password: "123456")
@user_mathieu = User.create!(first_name: "Mathieu", last_name: "Rabet", address: "132 Boulevard des optimistes, 50239 Hébécrevon", email: "rabet.mathieu@gmail.com", password: "123456")
puts 'Utilisateurs créés !'

puts "Création de nouvelles chaussettes..."
@sock1 = Sock.create!(user: @user_cedric, title: "Chaussette élégante", description: "Une chaussette à porter pour impressionner vos invités lors d'événements chics.", price: 5, state: Sock::STATES[0], color: Sock::COLORS[1], size: 42)
@sock2 = Sock.create!(user: @user_perrine, title: "Chaussette farfelue", description: "Si vous vous sentez une humeur de parfait déglingos, cette chaussette est faite pour vous.", price: 2, state: Sock::STATES[4], color: Sock::COLORS.last, size: 38)
@sock3 = Sock.create!(user: @user_mathieu, title: "Chaussette de warrior", description: "Une chaussette utilisée pour donner de la vigueur au combat, se marie parfaitement avec un gilet jaune.", price: 3, state: Sock::STATES[3], color: Sock::COLORS[5], size: 46)
@sock4 = Sock.create!(user: @user_marine, title: "Chaussette Gilles Verdez", description: "A ne porter uniquement que si vous êtes Gilles Verdez. Des choses terribles se produiront sinon.", price: 1, state: Sock::STATES[1], color: Sock::COLORS[4], size: 43)
@sock5 = Sock.create!(user: @user_cedric, title: "Chaussette de séduction", description: "Imprégnée d'extraits de rayanegosselingue, une plante aphrodisiaque, cette chaussette fera chavirer votre partenaire.", price: 10, state: Sock::STATES[0], color: Sock::COLORS[7], size: 44)
puts 'Chaussettes créées !'


puts "Création de nouvelles requêtes..."
Request.create!(start_date: "Tue, 5 Mar 2024", end_date: "Fri, 8 Mar 2024", user_msg: "Cette chaussette est farfelue à souhait. Il me la faut.", sock_id: @sock2.id , user_id: @user_mathieu.id)
Request.create!(start_date: "Wed, 28 Feb 2024", end_date: "Thu, 7 Mar 2024", user_msg: "J'ai besoin de cette chaussette pour séduire un homme marié.", sock_id: @sock5.id , user_id: @user_perrine.id)
Request.create!(start_date: "Fri, 8 Mar 2024", end_date: "Sat, 9 Mar 2024", user_msg: "J'ai besoin de cette chaussette pour éclater la tronche de la connasse qui m'a piqué mon mari.", sock_id: @sock3.id , user_id: @user_marine.id)
puts 'Requêtes créées!'
