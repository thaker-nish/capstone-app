class AddUrlAttributeToClubModel < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :url, :text
  end
end
