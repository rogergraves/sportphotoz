class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :photo, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.decimal :price, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
