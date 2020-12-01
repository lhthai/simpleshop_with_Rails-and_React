class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :phone
      t.string :email
      t.string :password
      t.string :billing_address
      t.string :shipping_address
      t.string :country

      t.timestamps
    end
  end
end
