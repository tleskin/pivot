# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.active_record.raise_in_transactional_callbacks = true
config.exceptions_app = routes
config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  user_name: ENV["SENDGRID_USERNAME"],
  password: ENV["SENDGRID_PASSWORD"],
  domain: "lendio.herokuapp.com",
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
