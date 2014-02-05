class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :picture
      t.string :invite_line
      t.datetime :start_date
      t.datetime :end_date
      t.integer :capacity
      t.float :price
      t.float :oldsalt_fee
      t.string :location_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :map_url
      t.text :attire
      t.text :what_to_bring
      t.text :notes
      t.text :warnings
      t.string :clue_url
      t.text :clue_text
      t.string :status

      t.timestamps
    end
  end
end