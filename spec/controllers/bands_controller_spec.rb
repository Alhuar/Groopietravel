require 'rails_helper'

RSpec.describe Api::V1::BandsController, type: :controller do

	before(:each) do
		user = User.create(name: "alfon", email: "alfon@alfon.com", password: "123456")
		band = Band.create(name: "Metallica", on_tour_until: "27/05/2016")
		users_favorite = UsersBand.where(user_id: user.id, band_id: band.id)
	end
	
	describe "Favorite Bands" do
		it "favorites a User´s band"
		
	end
end
