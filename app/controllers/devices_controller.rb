class DevicesController < ApplicationController
	layout 'admin'

	def index
		@device = Device.new	
	end

	def show
		@device = Device.new	
		render 'index'
  	end

	def create
		flash.clear
		respond_to do |format|
    		@device = Device.new(device_params)
    		if @device.save
    			flash[:notice] = "Device successfully added"
    			@device = Device.new
    		else
    			flash[:alert] = "Device Could not be added"
    		end

    		format.html { render 'index' }
 		end				
	end

	def edit
		@device = Device.find(params[:id])
	end

	def update
		@device = Device.find(params[:id])
	    respond_to do |format|
	      if @device.update(device_params)
	        flash[:notice] = "Device successfully updated"
	    	@device = Device.new
	      else
	        flash[:alert] = "Device Could not be updated"
	      end
	      format.html { render 'index' }
	    end
  end

	private
	  def device_params
	    params.require(:device).permit(:name, :vendor)
	  end
	end
