class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :listing_title, null: false
      t.text :listing_description, null: false
      t.references :user, null: false, foreign_key: true
      t.money :price, null: false
      t.string :condition, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
