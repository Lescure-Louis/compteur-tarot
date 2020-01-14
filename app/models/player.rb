class Player < ApplicationRecord
  belongs_to :game
  has_many :rounds
  validates :name, presence: true, length: { maximum: 15 }


end
