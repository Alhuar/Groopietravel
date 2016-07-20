class Api::V1::BandsController < ApplicationController
	def index
		render plain: "Hello"
	end
	
	def show
		@band = current_user.bands.find(params[:id])
	end

	def search
		bandname = params[:band].downcase.titleize
		@band = Band.find_by(name: bandname)
		unless @band
			render json: {band: bandname, error: "not found"}
			return
		end
		render json: {success: true, band: @band}
	end

	def create
		band = Band.create(
			name: params[:artistName],
			on_tour_until: params[:onTourUntil].to_date.strftime("%a %d %b %Y")
		)
		band.save_concerts(params['events'])
		current_user.bands.push(band)
		render json: band
	end

	def favorite_band
    	band = Band.find(params[:id])
    	query = UsersBand.find_by(user: current_user, band: band) || Band.check_if_query_exists?(query, current_user, band)
    	Band.make_favorite(query)
	 	 render json: band
	end

	def unfavorite
    	band = Band.find(params[:id])
		query = UsersBand.find_by(user: current_user, band: band)
		Band.make_unfavorite(query)
		#query.update_attribute(:is_favorite, false)
		render json: band
	end
end