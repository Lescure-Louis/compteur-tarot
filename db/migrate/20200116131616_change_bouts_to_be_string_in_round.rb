class ChangeBoutsToBeStringInRound < ActiveRecord::Migration[5.2]
  def change
    change_column :rounds, :bouts, :string
  end
end
