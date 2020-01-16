class ChangeLeveeToBeStringInRound < ActiveRecord::Migration[5.2]
  def change
    change_column :rounds, :chelem, :string
  end
end
