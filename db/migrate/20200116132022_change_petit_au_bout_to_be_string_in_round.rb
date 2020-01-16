class ChangePetitAuBoutToBeStringInRound < ActiveRecord::Migration[5.2]
  def change
    change_column :rounds, :petitAuBout, :string
  end
end
