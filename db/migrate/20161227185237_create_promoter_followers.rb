class CreatePromoterFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :promoter_followers do |t|
      t.integer :user_id
      t.integer :promoter_id

      t.timestamps
    end
  end
end
