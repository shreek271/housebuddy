class BasicPagesController < ApplicationController

  def home
  	@micropost = current_customer.issues.build if signed_in?
  end

  def contact
  end
  
end
