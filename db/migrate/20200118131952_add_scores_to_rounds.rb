class AddScoresToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :scores, :string
  end
end
