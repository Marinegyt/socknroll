class Sock < ApplicationRecord
  belongs_to :user
  # has_many :requests

  validates :title, :description, :price, :state, :color, :size, presence: true
  STATES = ['Excellent', 'Good', 'Average', 'Worn out', 'Hole included']
  validates :state, inclusion: { in: STATES }

end
