class AddSoldToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :sold, :boolean, default: false
  end
end
