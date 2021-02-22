class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :min_price
      t.datetime :deadline
      t.boolean :visible

      t.timestamps
    end
  end
end
