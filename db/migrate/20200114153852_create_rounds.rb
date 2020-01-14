class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.string :contract
      t.integer :bouts
      t.integer :attackPts
      t.integer :defensePts
      t.boolean :petitAuBout
      t.boolean :levee
      t.boolean :chelem
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
