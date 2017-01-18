class ChangeReservationDateInGuestlistModelToDatetime < ActiveRecord::Migration[5.0]
  def change
    remove_column :guestlists, :reservation_date, :string
  end
end
