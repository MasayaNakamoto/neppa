class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :shop_id
      t.integer :customer_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
