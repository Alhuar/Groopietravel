class Concert < ActiveRecord::Base
	acts_as_mappable :default_units => :kms,
                   	 :default_formula => :sphere,
                     :distance_field_name => :distance,
                     :lat_column_name => :latitude,
                     :lng_column_name => :longitude
	belongs_to :band
end
