class CustomerMailer < ApplicationMailer

  def account_activation(customer)
    @customer = customer
    mail to: @customer.email, subject: "Account activation"
  end

  def password_reset(customer)
    @customer = customer
    mail to: customer.email, subject: "Password reset"
  end
end
