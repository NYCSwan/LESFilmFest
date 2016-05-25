class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.float :star_value
      t.references :user, index: true
      t.references :film, index: true

      t.timestamps null: false
    end
  end
end
