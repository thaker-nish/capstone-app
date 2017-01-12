class CreateClubLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :club_locations do |t|
      t.integer :location_id
      t.integer :club_id

      t.timestamps
    end
  end
end
