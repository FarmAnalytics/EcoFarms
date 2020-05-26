class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :url
      t.string :address
      t.text :description
      t.float :surface
      t.boolean :private
      t.integer :employees
      t.string :cultures
      t.string :sector
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
