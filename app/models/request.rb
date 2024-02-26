class Request < ApplicationRecord
  belongs_to :sock
  belongs_to :user
  validates :start_date, :end_date, :user_msg, presence: true
  validates :user_msg, length: { minimum: 30 }
  validates_comparison_of :start_date, less_than: :end_date, greater_than: -> { Date.today }
end
