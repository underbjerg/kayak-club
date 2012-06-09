class AddDescriptionToEventOccurrences < ActiveRecord::Migration
  def change
    add_column :event_occurrences, :description, :text
  end
end
