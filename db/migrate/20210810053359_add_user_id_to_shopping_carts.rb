class AddUserIdToShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :user_id, :string
    add_index :shopping_carts, :user_id
  end
end
