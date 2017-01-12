class AddPromoterIdToPromotionTable < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :promoter_id, :integer
  end
end
