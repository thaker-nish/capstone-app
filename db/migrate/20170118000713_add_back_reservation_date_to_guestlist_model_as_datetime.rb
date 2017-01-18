class AddBackReservationDateToGuestlistModelAsDatetime < ActiveRecord::Migration[5.0]
  def change
    add_column :guestlists, :reservation_date, :string
  end
end
