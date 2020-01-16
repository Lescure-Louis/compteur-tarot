class AddHelpToRound < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :help, :string
  end
end
