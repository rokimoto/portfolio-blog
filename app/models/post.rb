class Post < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  def date_added
    created_at.localtime.strftime("%b %d, %Y")
  end

end
