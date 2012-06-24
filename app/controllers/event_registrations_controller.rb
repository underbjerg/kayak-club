
class EventRegistrationsController < ApplicationController
  before_filter :authenticate_user!
  check_authorization

  def create
    @event_registration = current_user.event_registrations.build(params[:event_registration])
    authorize! :create, @event_registration

    respond_to do |format|
      if @event_registration.save
        format.html { redirect_to( event_occurrence_path(@event_registration.event_occurrence), :notice => t('event_registration.created')) }
        format.js
      else
        format.html { redirect_to( event_occurrence_path(@event_registration.event_occurrence), :notice => t('event_registration.creation_failed')) }
        format.js
      end
    end
  end

  def destroy
    @event_registration = current_user.event_registrations.find(params[:id])
    authorize! :destroy, @event_registration

    respond_to do |format|
      if @event_registration
        @event_registration.destroy
        format.html { redirect_to( event_occurrence_path(@event_registration.event_occurrence), :notice => t('event_registration.deleted')) }
        format.js
      else
        format.html { redirect_to( event_occurrence_path(@event_registration.event_occurrence), :notice => t('event_registration.not_found') + ". id: " + params[:id]) }
        format.js
      end
    end
  end
end
