class Sock < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_one_attached :photo

  validates :title, :description, :price, :state, :color, :size, presence: true
  STATES = ['Excellent', 'Bien', 'Moyen', 'Usé', 'Avec un trou']
  validates :state, inclusion: { in: STATES }
  COLORS = ['Blanc', 'Noir', 'Bleu', 'Rouge', 'Vert', 'Jaune', 'Gris', 'Rose', 'Violet', 'Marron', 'Multicolore']
  validates :color, inclusion: { in: COLORS }
end
