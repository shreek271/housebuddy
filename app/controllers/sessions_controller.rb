class SessionsController < ApplicationController
  
  def new
  end

  def create
  	customer = Customer.find_by(email: params[:session][:email].downcase)
  	if customer && customer.authenticate(params[:session][:password])
  		sign_in customer
  		params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
  		redirect_back_or customer
  	else
  		flash.now[:danger] = "invalid email/password"
  		render 'new'
  	end
  end

  def destroy
  	sign_out if signed_in?
  	redirect_to root_url
  end

end
