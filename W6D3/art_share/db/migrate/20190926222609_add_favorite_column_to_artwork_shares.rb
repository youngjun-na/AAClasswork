class AddFavoriteColumnToArtworkShares < ActiveRecord::Migration[5.2]
  def change
    add_column :artwork_shares, :favorite, :boolean, :default=> false
  end
end
