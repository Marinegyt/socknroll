class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Chaussettes en tant que proprio
  has_many :socks, dependent: :destroy

  # Réservations en tant que proprio
  has_many :owner_requests, through: :socks, source: :requests

  # Réservations en tant que locataire
  has_many :requests, dependent: :destroy

  validates :first_name, :last_name, :address, presence: true
end
