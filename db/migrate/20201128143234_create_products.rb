class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.float :sku
      t.string :name
      t.float :price
      t.string :description
      t.string :thumbnail
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
