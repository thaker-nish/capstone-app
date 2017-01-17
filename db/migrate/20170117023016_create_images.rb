class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :club_id
      t.integer :promoter_id
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
