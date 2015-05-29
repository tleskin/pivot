module ApplicationHelper

  def turn_money_to_pennies(value)
    value.scan(/\d/).join('').to_i
  end

  def format_params(sent)
    {"name"=> sent["name"],
     "description"=> sent["description"],
     "funding_needed"=> turn_money_to_pennies(sent["funding_needed"]),
     "funding_to_date"=> turn_money_to_pennies(sent["funding_to_date"])}
  end

  def happy_forwarding(message = nil)
    if session[:forward]
      redirect_to({controller: session[:forward]['controller'],
                  action:      session[:forward]['action'],
                  region:      session[:forward]['region'],
                  id:          session[:forward]['id']},
                  success:     message)
    else
      redirect_to root_path
    end
  end

  def send_investment_emails(investments)
    investments.each do |investment|
      admins = User.where(region_id: Business.find_by(name: investment.business_name).region_id)
      send_admin_email(admins, investment)
    end
  end

  def send_admin_email(admins, investment)
    admins.each do |admin|

      UserNotifier.send_regional_manager_email(admin, investment).deliver_now
    end
  end

end
