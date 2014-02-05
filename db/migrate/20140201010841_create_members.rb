class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.string :password
      t.string :password_digest
      t.string :role
      t.boolean :active
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :remember_token 
      t.date   :expiration
      t.string :phone
      
      t.timestamps
    end
  end
end
