class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :member, index: true
      t.belongs_to :event, index: true
      t.string :rsvp
      t.boolean :is_lead, default: false
      t.datetime :last_viewed
      t.integer :guests
      t.string :rsvp, default: "Waiting"

      t.timestamps
    end
  end
end