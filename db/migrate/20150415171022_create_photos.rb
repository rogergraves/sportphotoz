class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :string

      t.timestamps null: false
    end
  end
end
