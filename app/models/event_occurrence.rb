class EventOccurrence < ActiveRecord::Base
  attr_accessible :end_at, :start_at

  belongs_to :event
  accepts_nested_attributes_for :event
  validates_presence_of :event

  has_many :event_registrations, :dependent => :destroy

  def name
    event.name + " (" + time_to_s + ")"
  end

  def time_to_s
    if start_at.to_date == end_at.to_date
      start_at.to_date.to_formatted_s(:short) + ", " + start_at.strftime("%H:%M") + "-" + end_at.strftime("%H:%M")
    else
      start_at.to_formatted_s(:short) + " - " + end_at.to_formatted_s(:short)
    end
  end

end
