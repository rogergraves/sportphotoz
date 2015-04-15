class CreateBibs < ActiveRecord::Migration
  def change
    create_table :bibs do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
