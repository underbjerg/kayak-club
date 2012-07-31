class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.

  default :from => "kajakpiloterne@underbjerg.com"

  def account_approved(user)
    @user = user
    @url  = "http://" + Rails.configuration.action_mailer.default_url_options[:host] + "/users/sign_in"
    mail(:to => user.email, :subject => t('mail.welcome_to_kajakpiloterne'))
  end

  def account_rejected(user)
    @user = user
    mail(:to => user.email, :subject => t('mail.account_rejected_subject'))
  end

  def account_created(user, password)
    @user = user
    @password = password
    @url  = "http://" + Rails.configuration.action_mailer.default_url_options[:host] + "/users/sign_in"
    mail(:to => user.email, :subject => t('mail.account_created_subject'))
  end

end