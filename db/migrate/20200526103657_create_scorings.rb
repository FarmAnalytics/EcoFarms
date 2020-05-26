class CreateScorings < ActiveRecord::Migration[6.0]
  def change
    create_table :scorings do |t|
      t.references :criterion, null: false, foreign_key: true
      t.references :farm, null: false, foreign_key: true
      t.integer :score
      t.text :details

      t.timestamps
    end
  end
end
