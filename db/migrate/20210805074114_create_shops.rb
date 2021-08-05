class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :postal_code
      t.string :address
      t.integer :phone_number
      t.string :homepage
      t.integer :price
      t.text :sauna

      t.timestamps
    end
  end
end
