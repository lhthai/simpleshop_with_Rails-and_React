class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, null: false, foreign_key:true
      t.float :amount
      t.string :shipping_address
      t.string :order_status, default: "pending"

      t.timestamps
    end
  end
end
