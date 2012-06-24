# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
KayakClub::Application.initialize!

# Configure mail settings
ActionMailer::Base.smtp_settings = {
    :address                => "smtp.gmail.com",
    :port                   => 587,
    :domain                 => "underbjerg.com",
    :user_name              => "kajakpiloterne@underbjerg.com",
    :password               => "havkajak",
    :authentication         => "plain",
    :enable_starttls_auto   => true
}