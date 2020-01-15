class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :rounds, dependent: :destroy

  validate :validate_players

  accepts_nested_attributes_for :players

    def validate_players
    errors.add(:players, "Please input 4 players") if players.size != 4
  end

end
