class BandsController < ApplicationController
	def index
		user = User.find(params[:user_id])
		#@user_bands = Band.where("user_id = ?", @user.id)
		@bands = current_user.bands
	end
	
	def show
		@band = current_user.bands.find(params[:id])
		@concerts = @band.concerts
	end
end