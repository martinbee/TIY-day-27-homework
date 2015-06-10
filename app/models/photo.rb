class Photo < ActiveRecord::Base

  mount_uploader :picture, PhotoUploader

end
