class Api::V1::BandsController < ApplicationController
	def index
		# user = User.find(params[:user_id])
		# #@user_bands = Band.where("user_id = ?", @user.id)
		# @bands = current_user.bands
		render plain: "Hello"

	end
	
	def show
		@band = current_user.bands.find(params[:id])
		@concerts = @band.concerts
	end

	def search
		bandName = params[:band].capitalize
		band = Band.find_by(name: bandName)
		#binding.pry
		unless band
			render json: {band: bandName, error: "not found"}
			return
		end
		
		# redirect_to user
		# render json: @band 
		# return

		#render json: band
	end

end