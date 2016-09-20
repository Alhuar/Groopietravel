class Band < ActiveRecord::Base

	# include Modules::Concert_storer
	has_many :users, :through => :users_band
	has_many :users_band, dependent: :destroy
	has_many :concerts, dependent: :destroy
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
		events.uniq{|concert| concert[:date] }
		events.each do |event1| 
			events.each do |event2|
				if event1[:date] == event2[:date]
					event1.merge!(event2)
				end
			end
		end
		# binding.pry
		events.each do |event|
			self.concerts.create(
				date: event[:date].to_date.strftime("%a %d %b %Y"), 
				city: event[:city], 
				name: event[:name], 
				venue: event[:venue], 
				longitude: event[:lng].to_f, 
				latitude: event[:lat].to_f)
		end

	end

end


# filtered_events = {}
# 		binding.pry
# 		events.each do |item|  
# 		  if filtered_events.has_key? item[1]['date']
# 		    filtered_events[item[1]['date']].merge! item[1]
# 		  else
# 		    filtered_events[item[1]['date']] = item[1]
# 		  end
# 		end

