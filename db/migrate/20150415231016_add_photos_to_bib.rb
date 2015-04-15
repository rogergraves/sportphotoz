class AddPhotosToBib < ActiveRecord::Migration
  def change
    add_column :bibs, :photo_id, :integer, :unique => true
  end
end
