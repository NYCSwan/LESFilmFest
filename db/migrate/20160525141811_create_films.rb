class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.string :writers
      t.string :actors
      t.string :director
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end
