class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :picture
      t.string    :role, default: "Member"
      t.boolean   :active
      t.string    :address1
      t.string    :address2
      t.string    :city
      t.string    :state
      t.string    :zip
      t.datetime  :expiration
      t.string    :phone
      
      t.timestamps
    end
  end
end
