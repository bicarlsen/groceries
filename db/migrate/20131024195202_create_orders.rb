class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :confirmation_code
      t.datetime :pickup_time
      t.boolean :is_purchased

      t.timestamps
    end
  end
end
