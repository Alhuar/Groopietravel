class Api::V1::BandsController < ApplicationController
	def index
		render plain: "Hello"
	end

	def show
		@band = current_user.bands.find(params[:id])
	end

	def search
		apikey = "&apikey=Nvz5ypKtb8V40c3S"
		band_name = params[:band].downcase.titleize
		@band = Band.find_by(name: band_name)
		unless @band
			band_info = HTTParty.get("http://api.songkick.com/api/3.0/search/artists.json?query=#{band_name}#{apikey}")
			band = Band.create(name: band_info['resultsPage']['results']['artist'][0]['displayName'],
									on_tour_until: band_info['resultsPage']['results']['artist'][0]['onTourUntil'])
			#get band_id from songkick to make ajax call in order to get band concerts
			band_id = band_info['resultsPage']['results']['artist'][0]['id']

			concerts_information = HTTParty.get("http://api.songkick.com/api/3.0/artists/#{band_id}/calendar.json?#{apikey}")
			concerts = get_concerts_from(concerts_information)
			band.save_concerts(concerts)
			render json: {success: true, band: band}
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

	private

	def get_concerts_from(response)
		events = response['resultsPage']['results']['event']
			@concerts = []
			events.each_with_index do |event, index|
				@concerts.push({
					city: event['location']['city'],
					date: event['start']['date'],
					lat: event['location']['lat'],
					lng: event['location']['lng'],
					name: event['displayName'],
					venue: event['venue']['displayName']})
			end
			@concerts
	end


end
