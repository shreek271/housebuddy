class SessionsController < ApplicationController
  
  def new
  end

  def create
  	customer = Customer.find_by(email: params[:session][:email].downcase)
  	if customer && customer.authenticate(params[:session][:password])
      if customer.activated?
  		sign_in customer
  		params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
  		redirect_back_or root_url
  	  else
        message = "Account not activated."
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
  		flash.now[:danger] = "invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
  	sign_out if signed_in?
  	redirect_to root_url
  end

end
