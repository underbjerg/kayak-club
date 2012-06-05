
class EventOccurrencesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @event_occurrences = EventOccurrence.order("start_at")
  end

  def show
    @event_occurrence = EventOccurrence.find(params[:id])
  end

end
