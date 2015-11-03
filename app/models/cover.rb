class Cover < ActiveRecord::Base
	 has_many :cover_images
	 belongs_to :device
end
