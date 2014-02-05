class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.float :price
      t.string :item_weight
      t.string :shipping_locations
      t.string :delivery_time
      t.float :shipping_price
      t.string :return_policy

      t.timestamps
    end
  end
end
