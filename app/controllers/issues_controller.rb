class IssuesController < ApplicationController

	before_action :signed_in_customer, only: [:create, :destroy]

	def create
		@service = Service.find(params[:issue][:service_id])
		@issue = current_customer.issues.build(issue_params)
		if @issue.save
			CustomerMailer.sr_confirmation(current_customer).deliver_now
			CustomerMailer.sr_provider(@service, current_customer, @issue).deliver_now
			flash[:success] = "Your service request has been made"
			redirect_to root_url
		else
			render 'new'
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
		params.require(:issue).permit(:content, :address, :zip, :city, :service_id)
	end
end
