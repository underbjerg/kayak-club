
class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    redirect_to event_occurrences_path if user_signed_in?
  end
end
