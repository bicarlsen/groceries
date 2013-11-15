class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :plu
      t.integer :upc
      t.decimal :quantity
      t.string :unit
      t.decimal :unit_price
      t.string :name

      t.timestamps
    end
  end
end
