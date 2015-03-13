class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :from_street
      t.string :from_house
      t.string :to_street
      t.string :to_house
      t.string :distance
      t.float :cost
      t.integer :status
      t.integer :circumstances, :default => 0
      t.string :phone
      t.boolean :deleted, :default => false

      t.timestamps
    end
  end
end
