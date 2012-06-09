
class EventOccurrencesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @event_occurrences = EventOccurrence.where("end_at >= ?", Time.now).order("start_at").page(params[:page]).per(6)
  end

  def show
    @event_occurrence = EventOccurrence.find(params[:id])
  end

end
