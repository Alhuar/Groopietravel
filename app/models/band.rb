class Band < ActiveRecord::Base
	has_many :users, :through => :users_band
	has_many :users_band
	has_many :concerts
	validates :name, presence: true	
	validates :on_tour_until, presence: true
	# validates :description, presence: true

	def self.check_if_query_exists?(query, user, band)
		unless query.present?
			user.bands.push(band)
		end
		UsersBand.find_by(user_id: user.id, band_id: band.id)
	end

	def self.make_favorite(query)
		query.update_attribute(:is_favorite, true) unless query.is_favorite
	end

	def self.make_unfavorite(query)
		query.update_attribute(:is_favorite, false) unless !query.is_favorite
	end

	def save_concerts(events)
		filtered_events = {}
		events.each do |item|  
		  if filtered_events.has_key? item[1][:date]
		    filtered_events[item[1][:date]].merge! item[1]
		  else
		    filtered_events[item[1][:date]] = item[1]
		  end
		end
		my_array = filtered_events.collect { |key, value| value }
		my_array.each do |item|
			date = item["date"].to_date.strftime("%a %d %b %Y")
			city = item["city"]
			latitude = item["lat"].to_f
			longitude = item["lng"].to_f
			name = item["name"]
			venue = item["venue"]
			self.concerts.create(
				date: date, 
				city: city, 
				name: name, 
				venue: venue, 
				longitude: longitude, 
				latitude: latitude
			)
		end

	end

end


