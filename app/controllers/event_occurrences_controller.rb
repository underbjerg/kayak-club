
class EventOccurrencesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @event_occurrences = EventOccurrence.all
  end

  def show
    @event_occurrence = EventOccurrence.find(params[:id])
  end

end
