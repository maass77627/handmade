class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :craft
      t.string :description
      t.integer :price
      t.boolean :purchased
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
