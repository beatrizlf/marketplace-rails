class ChangeValueToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :bids, :value, 'integer USING CAST(value AS integer)'
  end
end
