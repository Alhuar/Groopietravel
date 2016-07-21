class Api::V1::BandsController < ApplicationController
	def index
		render plain: "Hello"
	end
	
	def show
		@band = current_user.bands.find(params[:id])
	end

	def search
		## ## 
		bandname = params[:band].downcase.titleize
		## ##
		@band = Band.find_by(name: bandname)
		#insertar llamada a la api de songkick desde aquí y quitarla del front
		#=====================================================================
		binding.pry
		unless @band
			conn = Faraday.new(:url => 'http://sushi.com') do |faraday|
  faraday.request  :url_encoded             
  faraday.response :logger                  
  faraday.adapter  Faraday.default_adapter  
end







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
		concerts = params['events']
		band.save_concerts(concerts)
		current_user.add_band(band)
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