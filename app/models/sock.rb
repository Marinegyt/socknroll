class Sock < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :requests, dependent: :destroy

  validates :title, :description, :price, :state, :color, :size, presence: true
  STATES = ['Excellent', 'Good', 'Average', 'Worn out', 'Hole included']
  validates :state, inclusion: { in: STATES }
  COLORS = ['White', 'Black', 'Blue', 'Red', 'Green', 'Yellow', 'Grey', 'Pink', 'Purple', 'Brown', 'Multicolor']
  validates :color, inclusion: { in: COLORS }
end
