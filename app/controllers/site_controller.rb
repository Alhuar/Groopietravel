class SiteController < ApplicationController
	skip_before_action :authenticate_user!	
	before_filter :disable_nav, only: [:index]	
	
	def index
	end
end
