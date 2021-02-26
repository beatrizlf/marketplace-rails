class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :min_price
      t.datetime :deadline
      t.boolean :visible, default: false
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
