class CategoriesController < ApplicationController
  def index
    render json: Post.tag_counts_on(:tags).map(&:name)
  end
end
