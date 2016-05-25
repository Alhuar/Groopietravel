class Api::V1::BandsController < ApplicationController
	def index
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
	end

	def create
		band = Band.create(
			name: params[:artistName],
			on_tour_until: params[:onTourUntil].to_date.strftime("%a %d %b %Y")
		)
		
		filtered_events = {}
		
		params['events'].each do |item|
		  
		  if filtered_events.has_key? item[1][:date]
		    filtered_events[item[1][:date]].merge! item[1]
		  else
		    filtered_events[item[1][:date]] = item[1]
		  end
		end
		my_array = filtered_events.collect { |key, value| value }
		 # binding.pry
		my_array.each do |item|
			date = item["date"].to_date.strftime("%a %d %b %Y")
			city = item["city"]
			latitude = item["lat"].to_f
			longitude = item["lng"].to_f
			name = item["name"]
			venue = item["venue"]
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
    query = UsersBand.find_by(user: current_user, band: band) || Band.check_if_query_exists?(query, current_user, band)
    Band.make_favorite(query)
	  render json: band
	end
end