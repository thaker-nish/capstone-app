class ChangeClubStringToClubNameInPromotionModel < ActiveRecord::Migration[5.0]
  def change
    rename_column :promotions, :club, :club_name
  end
end
