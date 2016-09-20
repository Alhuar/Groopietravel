class BandsController < ApplicationController
	include Geokit::Geocoders

	def index
		user = User.find(params[:user_id])
		#@user_bands = Band.where("user_id = ?", @user.id)
		@user_bands = user.bands
	end
	
	def show
		@band = current_user.bands.find(params[:id])
		@concerts = @band.concerts
		a = Geokit::LatLng.new(@band.concerts[0].latitude,@band.concerts[0].longitude)
		b = Geokit::LatLng.new(@band.concerts[1].latitude,@band.concerts[1].longitude)
		@distance = a.distance_to(b)
		@city1 = @band.concerts[0].city
		@city2 = @band.concerts[1].city
		# binding.pry
	end
end