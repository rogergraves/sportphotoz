class RemoveBibs < ActiveRecord::Migration
  def change
    drop_table :bibs
  end
end
