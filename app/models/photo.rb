class Photo < ActiveRecord::Base

  mount_uploader :picture, PhotoUploader
  acts_as_taggable

end
