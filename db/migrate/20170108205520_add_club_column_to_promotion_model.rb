class AddClubColumnToPromotionModel < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :club, :string
  end
end
