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
Request.destroy_all
Sock.destroy_all
User.destroy_all
puts "Chaussettes détruites!"
puts "Utilisateurs détruits!"
puts "Requêtes détruites!"

puts "Création de nouveaux utilisateurs..."
@user_marine = User.create!(first_name: "Marine", last_name: "Gayet", address: "68 Mail François Mitterrand, 35000 Rennes", email: "marinegayet@gmail.com", password: "123456")
@user_perrine = User.create!(first_name: "Perrine", last_name: "Guerrapin", address: "2 Rue de la Mabilais, 35000 Rennes", email: "perrine.guerrapin@gmail.com", password: "123456")
@user_cedric = User.create!(first_name: "Cédric", last_name: "Mingam", address: "6 Rue des Portes Mordelaises, 35000 Rennes", email: "truc1@truc.com", password: "123456")
@user_mathieu = User.create!(first_name: "Mathieu", last_name: "Rabet", address: "11 rue d'échange, 35000 Rennes", email: "rabet.mathieu@gmail.com", password: "123456")
puts 'Utilisateurs créés !'

puts "Création de nouvelles chaussettes..."
@sock1 = Sock.new(user: @user_cedric, title: "Chaussette élégante", description: "Une chaussette à porter pour impressionner vos invités lors d'événements chics.", price: 5, state: Sock::STATES[0], color: Sock::COLORS[1], size: 42)
file = URI.open('https://res.cloudinary.com/djolwxrtw/image/upload/v1709135320/le-bar-a-chaussettes-chaussettes-bambou-confort-noires-51723947245901_tldbmg.jpg')
@sock1.photo.attach(io: file, filename: 'elegant.jpg', content_type: 'image/jpg')
@sock1.save!
@sock2 = Sock.new(user: @user_perrine, title: "Chaussette farfelue", description: "Si vous vous sentez une humeur de parfait déglingos, cette chaussette est faite pour vous.", price: 2, state: Sock::STATES[4], color: Sock::COLORS.last, size: 38)
file = URI.open('https://res.cloudinary.com/djolwxrtw/image/upload/v1709135486/CS-Maiden-Socks-01b_u1jffv.jpg')
@sock2.photo.attach(io: file, filename: 'wacky.jpg', content_type: 'image/jpg')
@sock2.save!
@sock3 = Sock.new(user: @user_mathieu, title: "Chaussette de warrior", description: "Une chaussette utilisée pour donner de la vigueur au combat, se marie parfaitement avec un gilet jaune.", price: 3, state: Sock::STATES[3], color: Sock::COLORS[5], size: 46)
file = URI.open('https://res.cloudinary.com/djolwxrtw/image/upload/v1709135192/le-bar-a-chaussettes-chaussettes-bambou-jacquard-jaunes-moutarde-52351629164877_rjsgox.jpg')
@sock3.photo.attach(io: file, filename: 'warrior.jpg', content_type: 'image/jpg')
@sock3.save!
@sock4 = Sock.new(user: @user_marine, title: "Chaussette Gilles Verdez", description: "A ne porter uniquement que si vous êtes Gilles Verdez. Des choses terribles se produiront sinon.", price: 1, state: Sock::STATES[1], color: Sock::COLORS[4], size: 43)
file = URI.open('https://res.cloudinary.com/djolwxrtw/image/upload/v1709136161/Capture_d_e%CC%81cran_2024-02-28_a%CC%80_17.02.14_sptfiq.png')
@sock4.photo.attach(io: file, filename: 'gilles.jpg', content_type: 'image/jpg')
@sock4.save!
@sock5 = Sock.new(user: @user_cedric, title: "Chaussette de séduction", description: "Imprégnée d'extraits de rayanegosselingue, une plante aphrodisiaque, cette chaussette fera chavirer votre partenaire.", price: 10, state: Sock::STATES[0], color: Sock::COLORS[7], size: 44)
file = URI.open('https://res.cloudinary.com/djolwxrtw/image/upload/v1709136364/SK-SKA-FUN-007-CID-1b_hq8yls.jpg')
@sock5.photo.attach(io: file, filename: 'seduction.jpg', content_type: 'image/jpg')
@sock5.save!
puts 'Chaussettes créées !'


puts "Création de nouvelles requêtes..."
Request.create!(start_date: "Tue, 5 Mar 2024", end_date: "Fri, 8 Mar 2024", user_msg: "Cette chaussette est farfelue à souhait. Il me la faut.", sock: @sock2 , user: @user_mathieu)
Request.create!(start_date: "Wed, 28 Feb 2024", end_date: "Thu, 7 Mar 2024", user_msg: "J'ai besoin de cette chaussette pour séduire un homme marié.", sock: @sock5 , user: @user_perrine)
Request.create!(start_date: "Fri, 8 Mar 2024", end_date: "Sat, 9 Mar 2024", user_msg: "J'ai besoin de cette chaussette pour éclater la tronche de la connasse qui m'a piqué mon mari.", sock: @sock3 , user: @user_marine)
puts 'Requêtes créées!'
