class AddHelp1ToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :help1, :string
  end
end
