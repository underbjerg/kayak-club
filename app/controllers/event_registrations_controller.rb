
class EventRegistrationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event_registration = current_user.event_registrations.build(params[:event_registration])
    if @event_registration.save
      flash[:notice] = t('event_registration.created')
    else
      flash[:notice] = t('event_registration.creation_failed')
    end
    redirect_to event_occurrences_path
  end

  def destroy
    @event_registration = current_user.event_registrations.find(params[:id])
    if @event_registration
      @event_registration.destroy
      redirect_to event_occurrences_path, :notice => t('event_registration.deleted')
    else
      redirect_to event_occurrences_path, :notice => t('event_registration.not_found') + ". id: " + params[:id]
    end
  end
end
