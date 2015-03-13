class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :from_street
      t.string :from_house
      t.string :to_street
      t.string :to_house
      t.string :distance
      t.float :cost
      t.boolean :sended, :default => false

      t.timestamps
    end
  end
end
