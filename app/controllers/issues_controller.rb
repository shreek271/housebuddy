class IssuesController < ApplicationController

	before_action :signed_in_customer, only: [:create, :destroy]

	def create
		@issue = current_customer.issues.build(issue_params)
		if @issue.save
			flash[:success] = "Your service request has been made"
			redirect_to root_url
		else
			render 'basic_pages/home'
		end
	end

	def new
		@issue = Issue.new
	end

	def update
	end

	def destroy
	end

	private

	def issue_params
		params.require(:issue).permit(:content, :address)
	end
end
