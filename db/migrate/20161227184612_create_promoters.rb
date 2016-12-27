class CreatePromoters < ActiveRecord::Migration[5.0]
  def change
    create_table :promoters do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
