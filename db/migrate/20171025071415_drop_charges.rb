class DropCharges < ActiveRecord::Migration[5.1]
  def change
    drop_table :charges
  end
end
