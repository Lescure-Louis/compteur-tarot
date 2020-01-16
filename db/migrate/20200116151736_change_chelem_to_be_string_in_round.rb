class ChangeChelemToBeStringInRound < ActiveRecord::Migration[5.2]
  def change
    change_column :rounds, :levee, :string

  end
end
