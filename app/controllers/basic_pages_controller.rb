class BasicPagesController < ApplicationController

  def home
  	@issue = current_customer.issues.build if signed_in?
  end

  def contact
  end
  
end
