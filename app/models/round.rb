COL = [nil, "attaque", "defense"]

class Round < ApplicationRecord
  belongs_to :game
  belongs_to :player
  has_many :other
  validates :contract, presence: true, inclusion: { in: ["Prise", "Garde", "Garde Sans", "Garde Contre"] }
  validates :bouts, presence: true, inclusion: { in: [0, 1, 2, 3] }
  validates :petitAuBout, inclusion: { in: ["", "attaque", "defense"] }
  validates :chelem, inclusion: { in: ["", "anoncé", "non-anoncé", "non-réalisé"] }
  validates :levee, inclusion: { in: ["", "atc-S", "atc-D", "atc-T", "def-S", "def-D", "def-T"] }
  validate :sum_equals_91

  accepts_nested_attributes_for :other
  private

  def sum_equals_91
    p attackPts + defensePts != 91
    if attackPts + defensePts != 91
      errors.add(:base, "La somme des points d\'attaque et de défense doit etre 91")
    end
  end


end
