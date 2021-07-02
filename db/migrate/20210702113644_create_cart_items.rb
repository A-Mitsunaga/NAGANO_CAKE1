class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.integer :item_id
      t.integer :customer_id
      t.integer :amount
      t.timestamps
    end
  add_foreign_key :cart_items, :item_id
  add_foreign_key :cart_items, :customer_id
  end
end
