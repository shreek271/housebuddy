class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def signed_in_customer
  		unless signed_in?
  		store_location
  		flash[:danger] = "Please, Sign In."
  		redirect_to signin_url
  	end
  end
  
end
