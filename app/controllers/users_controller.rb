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
		 # binding.pry
		matches = Array.new
		for i in (0..@user_concerts.length) do 
			for j in (i+1..@user_concerts.length-1) do
				if @user_concerts[i].city == @user_concerts[j].city && @user_concerts[i].date == @user_concerts[j].date
					matches.push(@user_concerts[i])
					matches.push(@user_concerts[j])
				end
			end
		end

	  
	  # binding.pry
	end

private

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_controller)
    end

end
