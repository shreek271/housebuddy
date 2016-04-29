# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/account_activation
  def account_activation
  	customer = Customer.first
    customer.activation_token = Customer.new_token
    CustomerMailer.account_activation(customer)
  end

  def sr_confirmation
    customer = Customer.first
    CustomerMailer.sr_confirmation(customer)
  end

  def sr_provider
    service = Service.first
    customer = Customer.first
    issue = Issue.first
    CustomerMailer.sr_provider(service, customer,issue)
  end

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/password_reset
  def password_reset
    customer = Customer.first
    customer.reset_token = Customer.new_token
    CustomerMailer.password_reset(customer)
  end

end
