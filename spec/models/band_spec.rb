require 'rails_helper'

RSpec.describe Band, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
		@user = User.create(name: "alfon", email: "alfon@alfon.com", password: "123456")
		@band = Band.create(name: "Metallica", on_tour_until: "27/05/2016")
		@query = UsersBand.find_by(user: @user, band: @band) || Band.check_if_query_exists?(@query, @user, @band)			

	end
	
	describe "check_if_query_exists?" do
		it "create relation between user and band" do
			@query = UsersBand.where(user_id: @user, band_id: @band)
			Band.check_if_query_exists?(@query, @user, @band)
			expect(@query.exists?).to be(true) 
		end
	end
	describe "make_favorite" do
		it "user favoritizes a band" do
			@user.bands.push(@band)
			Band.make_favorite(@query)
			expect(@query.is_favorite).to be(true)
		end
	end

		describe "make_favorite" do
		it "user unfavoritizes a band" do
			@user.bands.push(@band)
			Band.make_favorite(@query)
			Band.make_unfavorite(@query)
			expect(@query.is_favorite).to be(false)
		end
	end

		describe "make_favorite" do
		it "user can´t unfavorite a non-favorite band" do
			@user.bands.push(@band)
			Band.make_unfavorite(@query)
			expect(@query.is_favorite).to be(false)
		end
	end
	
	describe "make_favorite" do
		it "user can´t favorite a favorite band" do
			@user.bands.push(@band)
			Band.make_favorite(@query)
			expect(@query.is_favorite).to be(true)
		end
	end
end



