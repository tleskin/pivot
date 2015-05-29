class UserNotifier < ActionMailer::Base
  default :from => 'tleskin@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for Lend.io' )
  end

  def send_investment_email(user, investments)
    @user = user
    @investments = investments

    mail( to: @user.email,
    subject: "Investments on #{@investments.first.date}: Thanks for your investments!")
  end

  def send_regional_manager_email(admin, investment)
    @admin = admin
    @investment = investment

    mail( to: @admin.email,
    subject: "Investment recieved!")
  end

  def send_new_region_email_registered(current_user, region)
    @current_user = current_user
    @region = region

    mail( to: @current_user.email,
    subject: "Region created!")
  end

  def send_new_region_email_guest(email, region)
    @email = email
    @region = region

    mail( to: @email,
    subject: "Region created!")
  end


end
