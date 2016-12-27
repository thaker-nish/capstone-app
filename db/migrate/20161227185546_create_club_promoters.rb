class CreateClubPromoters < ActiveRecord::Migration[5.0]
  def change
    create_table :club_promoters do |t|
      t.integer :club_id
      t.integer :promoter_id

      t.timestamps
    end
  end
end
