class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :role
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
