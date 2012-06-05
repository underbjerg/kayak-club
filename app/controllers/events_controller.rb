
class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(:params[:id])
  end
end
