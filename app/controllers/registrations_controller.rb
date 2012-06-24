class RegistrationsController < Devise::RegistrationsController

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    users_registration_received_path
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    users_registration_received_path
  end

  def registration_received

  end
end