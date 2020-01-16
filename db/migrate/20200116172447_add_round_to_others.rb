class AddRoundToOthers < ActiveRecord::Migration[5.2]
  def change
    add_reference :others, :round, foreign_key: true
  end
end
