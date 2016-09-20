class UsersController < ApplicationController
	include Geokit::Geocoders
 	before_action :authenticate_user!
 	before_filter :disable_nav, only: [:show]	

	def index
		@users = User.all
	end
	
	def show
		bands_ids_array =  UsersBand.where(user_id: current_user.id, is_favorite: true).pluck(:band_id)
		
		@user_favorite_bands = User.favorite_bands(bands_ids_array)
	
	 	@user_favorite_concerts = Array.new	 	
	 	@user_favorite_bands.each do |band|
	 		band.concerts.map do |concert|
	 			@user_favorite_concerts.push(concert)
	 		end
		end
		
		@concert_matches = Array.new
		for i in (0..@user_favorite_concerts.length) do 
			for j in (i+1..@user_favorite_concerts.length-1) do
				if @user_favorite_concerts[i].city == @user_favorite_concerts[j].city && @user_favorite_concerts[i].date == @user_favorite_concerts[j].date 
					@concert_matches.push(@user_favorite_concerts[i])
					@concert_matches.push(@user_favorite_concerts[j])
				end
			end
		end
	   @bands_matched = @concert_matches.map do |concert|
	   		Band.find_by(id: concert.band_id)
	   	end
	   	# binding.pry
	end

private

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_controller)
    end

end
