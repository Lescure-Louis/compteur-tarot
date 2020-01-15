class Round < ApplicationRecord
  belongs_to :game
  belongs_to :player
  validates :contract, presence: true, inclusion: { in: ["Prise", "Garde", "Garde Sans", "Garde Contre"] }
  validates :bouts, presence: true, inclusion: { in: [0, 1, 2, 3] }
  validate :sum_equals_91


  private

  def sum_equals_91
    p attackPts + defensePts != 91
    if attackPts + defensePts != 91
      errors.add(:base, "La somme des points d\'attaque et de défense doit etre 91")
    end
  end


end
