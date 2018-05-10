class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :category
      t.string :name
      t.timestamp :start_at
      t.timestamp :end_at
      t.timestamp :checkin
      t.timestamp :checkout
      t.string :address
      t.string :url
      t.string :itinerary_url
      t.string :confirmation_number
      t.timestamps
    end
  end
end
