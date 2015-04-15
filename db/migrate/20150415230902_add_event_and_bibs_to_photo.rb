class AddEventAndBibsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :event_id, :integer, :unique => true
    add_column :photos, :bib_id, :integer
  end
end
