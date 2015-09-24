class Project < ActiveRecord::Base
  mount_uploader :preview_image, PictureUploader
end
