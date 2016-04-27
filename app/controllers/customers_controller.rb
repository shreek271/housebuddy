class CustomersController < ApplicationController

	before_action :signed_in_customer, only: [:edit, :update, :destroy]
	before_action :correct_customer, only: [:edit, :update]
  before_action :admin_customer,     only: :destroy

  def show
  	@customer = Customer.find(params[:id])
    @issues = @customer.issues.paginate(page: params[:page])

  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
      @customer.send_activation_email
      flash[:info] = "Please check your email to activate your account."
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def index
    @customers = Customer.all
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

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted"
    redirect_to customers_url
  end

  private

  def customer_params
  	params.require(:customer).permit(:name, :email, :mobile, :password,
  					 :password_confirmation)
  end

  def correct_customer
  	@customer = Customer.find(params[:id])
  	redirect_to root_url unless current_customer?(@customer)
  end

  def admin_customer
      redirect_to(root_url) unless current_customer.admin?
  end
end
