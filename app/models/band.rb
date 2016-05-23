class Band < ActiveRecord::Base
	has_many :users, :through => :users_band
	has_many :users_band
	has_many :concerts
	validates :name, presence: true	
	# validates :image, presence: true
	# validates :description, presence: true


	# def make_favorite(user)
	# 	query = UsersBand.find_by(user: user.id, band: band.id)
	# 	query.update_attribute(:is_favorite, true) unless query.is_favorite		
	# end



	def self.check_if_query_exists?(query, user, band)
		unless query.present?
			user.bands.push(band)
		end
		@query = UsersBand.find_by(user_id: user.id, band_id: band.id)
	end
end


