class EmergenciesController < ApplicationController
	before_action :find_emergency, only: [ :show, :destroy]

	def index
		@emergencies = Emergency.all
	end
	
	def show
	end
	
	def create

	end
	
	def destroy

	end

	private

	def find_emergency
		@emergency = Emergency.find(params[:id])
	end

end
