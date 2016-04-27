class ServicesController < ApplicationController
  
  def new
  	@service = Service.new
  end

  def create
  	@service = Service.create(service_params)
  	if @service.save
  		flash[:success] = "Service Added to the service page"
  		redirect_to services_path
  	else
  		render 'new'
  	end
  end

  def index
    @services = Service.all
  end

  private

  def service_params
  	params.require(:service).permit(:name, :email, :photo)
  end
  
end
