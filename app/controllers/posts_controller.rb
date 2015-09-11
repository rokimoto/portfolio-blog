class PostsController < ApplicationController

  before_action :require_user, except: [:show, :index, :feed]

  def index
    @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 2)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def feed
    @posts = Post.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :picture, :author_id, :slug)
  end

end
