class CreateMarathons < ActiveRecord::Migration
  def change
    create_table :marathons do |t|
      t.string :name,       null: false
      t.string :slug,       null: false
      t.datetime :event_date
      t.string :aws_prefix, null: false
      t.boolean :active

      t.timestamps null: false
    end

    add_index :marathons, :slug
  end
end
