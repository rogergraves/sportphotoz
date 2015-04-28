class UpdatePhotosFields < ActiveRecord::Migration
  def change
    remove_columns :photos, :event_id, :bib_id
    rename_column  :photos, :url, :aws_key
    add_reference  :photos, :participant
    add_reference  :photos, :marathon
  end
end
