
class EventOccurrencesController < ApplicationController

  def index
    @event_occurrences = EventOccurrence.all
  end

  def show
    @event_occurrence = EventOccurrence.find(params[:id])
  end

end
