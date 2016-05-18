class BandsController < ApplicationController
	def index
		user = User.find(params[:user_id])
		@band = user.bands.find(params[:id])
	end
	
	def show
	
	end
end