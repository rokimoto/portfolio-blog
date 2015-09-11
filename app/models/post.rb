class Post < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  def date_added
    created_at.localtime.strftime("%b %d, %Y")
  end

end
