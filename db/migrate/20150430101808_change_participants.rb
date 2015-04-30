class ChangeParticipants < ActiveRecord::Migration
  def change
    remove_column :participants, :gun_time
    remove_column :participants, :chip_time

    add_column :participants, :gun_time, :integer
    add_column :participants, :chip_time, :integer
  end
end
