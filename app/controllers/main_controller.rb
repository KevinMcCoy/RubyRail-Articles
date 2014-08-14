class MainController < ApplicationController
	#@data = HospitalBooking.where(:created_at => @date_range)
	@data = Receipt.all
end
