require 'rails_helper'

RSpec.describe 'routes', type: :routing do
	   it 'shows main site' do
	    expect(get: '/').to route_to(controller: 'site', action: 'index')
	  end

  		it 'tests api calls to api/v1/favorite_band' do
    	expect(post(api_v1_bands_favorite_band_path(band_id: '1'))).to route_to(controller: 'api/v1/bands', action: 'favorite_band', band_id: '1')
  	  end
 end



  