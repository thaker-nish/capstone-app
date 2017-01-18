class AddAddressToClubmodel < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :address, :string
  end
end
