class Listing < ActiveRecord::Base
	belongs_to :user
	acts_as_taggable
	mount_uploaders :images, ListingImagesUploader
	has_many :reservations, :foreign_key => :listing_id
end
