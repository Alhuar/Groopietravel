class UsersBand < ActiveRecord::Base
	belongs_to :user
	belongs_to :band
end
