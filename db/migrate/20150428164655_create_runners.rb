class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender, default: 0, limit: 1
      t.integer :age
      t.string :email
      t.string :state, limit: 2
      t.string :city

      t.timestamps null: false
    end
  end
end
