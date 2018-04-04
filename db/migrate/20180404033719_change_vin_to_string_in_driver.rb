class ChangeVinToStringInDriver < ActiveRecord::Migration[5.1]
  def change
    change_column :drivers, :vin, :string
  end
end
