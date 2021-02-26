class ChangeMinPriceType < ActiveRecord::Migration[6.0]
  def change
    change_column :auctions, :min_price, 'integer USING CAST(min_price AS integer)'
  end
end
