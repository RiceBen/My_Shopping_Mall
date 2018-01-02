class CreateAddQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :add_quantities do |t|

      t.timestamps
    end
  end
end
