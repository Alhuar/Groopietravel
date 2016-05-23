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
		bandname = params[:band].downcase.titleize
		@band = Band.find_by(name: bandname)
		unless @band
			render json: {band: bandname, error: "not found"}
			return
		end
		
		render json: {success: true, band: @band}
		#redirect_to users_path 
	end

	def create
		band = Band.create(
			name: params[:artistName],
			on_tour_until: params[:onTourUntil].to_date.strftime("%a %d %b %Y")
		)
		params['events'].each do |key, value|
			date = value["date"].to_date.strftime("%a %d %b %Y")
			city = value["city"]
			latitude = value["lat"]
			longitude = value["lng"]
			name = value["name"]
			venue = value["venue"]
			band.concerts.create(
				date: date, 
				city: city, 
				name: name, 
				venue: venue, 
				longitude: longitude, 
				latitude: latitude
				)
		end
		current_user.bands.push(band)
		render json: band
	end

	def favorite_band
    band = Band.find(params[:id])
    @query = UsersBand.find_by(user: current_user, band: band)
    Band.check_if_query_exists?(query, current_user, band)
    # query = UsersBand.find_by(user_id: current_user.id, band_id: band.id)
    #Y con esto: =>
    query.update_attribute(:is_favorite, true) unless query.is_favorite
	  render json: band
	end
end