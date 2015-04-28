class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :bib
      t.integer :place
      t.time :gun_time
      t.time :chip_time
      t.references :runner
      t.references :marathon

      t.timestamps null: false
    end

    add_index :participants, [:bib, :runner_id, :marathon_id], unique: true
  end
end
