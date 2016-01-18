require 'carrierwave/orm/activerecord'

class Listing < ActiveRecord::Base
	belongs_to :user

	mount_uploaders :images, ImagesUploader
end
