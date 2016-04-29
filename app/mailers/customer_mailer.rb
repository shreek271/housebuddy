class CustomerMailer < ApplicationMailer

  def account_activation(customer)
    @customer = customer
    mail to: @customer.email, subject: "Account activation"
  end

  def sr_confirmation(customer)
  	@customer = customer
  	mail to: @customer.email, subject: "Service Request Confirmation"
  end

  def sr_provider(service, customer, issue)
  	@service = service
  	@customer = customer
  	@issue = issue
  	mail to: @service.email, subject: "New Service Request"
  end

  def password_reset(customer)
    @customer = customer
    mail to: customer.email, subject: "Password reset"
  end
end
