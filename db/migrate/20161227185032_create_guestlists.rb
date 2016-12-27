class CreateGuestlists < ActiveRecord::Migration[5.0]
  def change
    create_table :guestlists do |t|
      t.integer :club_id
      t.integer :promoter_id
      t.integer :user_id
      t.integer :promotion_id
      t.integer :guests
      t.string :reservation_date

      t.timestamps
    end
  end
end
