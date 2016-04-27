module SessionsHelper

	#sign_in for customer
	def sign_in(customer)
		session[:customer_id] = customer.id
	end

	#set the cookies to remember customer
	def remember_customer(customer)
		customer.remember
		cookies.permanent.signed[:customer_id] = customer.id
		cookies.permanent[:remember_token] = customer.remember_token
	end

	# Returns true if the given customer is the current customer.
	def current_customer?(customer)
		customer == current_customer
	end

	#get the current customer
	def current_customer
		if (customer_id = session[:customer_id])
			@current_customer ||= Customer.find_by(id: customer_id)
		elsif (customer_id = cookies.signed[:customer_id])
			customer = Customer.find_by(id: customer_id)
			if customer && customer.authenticated?(:remember, cookies[:remember_token])
			sign_in customer
			@current_customer = customer_id
			end	
		end 
	end

	#to know if the customer is signed in or not
	def signed_in?
		!current_customer.nil?
	end

	#friendly forwarding
	def redirect_back_or(default)
    	redirect_to(session[:forwarding_url] || default)
    	session.delete(:forwarding_url)
  	end

  	def store_location
    	session[:forwarding_url] = request.url if request.get?
  	end

	#delete the cookies credentials
	def forget(customer)
		customer.forget
		cookies.delete(:customer_id)
		cookies.delete(:remember_token)
	end

	#signout customer
	def sign_out
		forget(current_customer)
		session.delete(:customer_id)
		current_customer = nil
	end
end
