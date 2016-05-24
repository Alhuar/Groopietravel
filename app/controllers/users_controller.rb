class UsersController < ApplicationController
	include Geokit::Geocoders

	def index
		@users = User.all
	end
	
	def show
		bands_ids_array =  UsersBand.where(user_id: current_user.id, is_favorite: true).pluck(:band_id)
		@user_favorite_bands = [] 
		bands_ids_array.each do |id|
			 @user_favorite_bands << Band.find(id)
			end		
	 	@user_concerts = []
	 	@user_favorite_bands.each do |band|
	 		band.concerts.each do |concert|
	 			@user_concerts.push(concert)
	 		end
		end
		# @users_concerts.each do |concert|
		 binding.pry

		#end

	end

private

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_controller)
    end

end
