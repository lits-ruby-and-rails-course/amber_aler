class VisitorsController < ApplicationController
	def index
		@emergencies = Emergency.order(updated_at: :desc).limit(5)
	end
end
