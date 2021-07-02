class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_cost, null: false, default: "800"
      t.integer :billing_amount
      t.integer :payment_method, null: false, default: "0"
      t.timestamps
    end
    add_foreign_key :orders, :customers
  end
end