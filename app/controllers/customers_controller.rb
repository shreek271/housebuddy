class CustomersController < ApplicationController

	before_action :signed_in_customer, only: [:edit, :update]
	before_action :correct_customer, only: [:edit, :update]

  def show
  	@customer = Customer.find(params[:id])
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		sign_in @customer
  		flash[:success] = "Successfully registered"
  		redirect_to @customer
  	else
  		render 'new'
  	end
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update_attributes(customer_params)
  		flash[:success] = "profile updated"
  		redirect_to @customer
  	else
  		render 'edit'
  	end
  end

  private

  def customer_params
  	params.require(:customer).permit(:name, :email, :mobile, :password,
  					 :password_confirmation)
  end

  def signed_in_customer
  	unless signed_in?
  		store_location
  		flash[:danger] = "Please, Sign In."
  		redirect_to signin_url
  	end
  end

  def correct_customer
  	@customer = Customer.find(params[:id])
  	redirect_to root_url unless current_customer?(@customer)
  end
end
