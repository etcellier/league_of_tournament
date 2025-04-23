class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.datetime :date
      t.integer :score_team1
      t.integer :score_team2
      t.references :team1, foreign_key: { to_table: :teams }
      t.references :team2, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end