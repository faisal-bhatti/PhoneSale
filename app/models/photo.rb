class Photo < ActiveRecord::Base
  attr_accessible :image, :phone_id

  # belongs_to :phone

  mount_uploader :image, ImageUploader
end
