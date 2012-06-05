class CreateEventOccurrences < ActiveRecord::Migration
  def change
    create_table :event_occurrences do |t|
      t.integer :event_id
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
