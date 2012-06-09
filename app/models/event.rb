class Event < ActiveRecord::Base
  attr_accessible :description, :location, :name

  has_many :event_occurrences, :order => "start_at ASC", :dependent => :destroy

  accepts_nested_attributes_for :event_occurrences
  attr_accessible :event_occurrences
  attr_accessible :event_occurrences_attributes
end
