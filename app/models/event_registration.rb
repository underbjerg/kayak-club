class EventRegistration < ActiveRecord::Base
  attr_accessible :event_occurrence_id, :user_id

  belongs_to :user
  belongs_to :event_occurrence

  validates_presence_of :user, :event_occurrence


end
