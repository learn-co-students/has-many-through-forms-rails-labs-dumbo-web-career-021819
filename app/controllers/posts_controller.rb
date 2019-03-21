class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @users = User.all
  end

  def index
    @posts = Post.all
  end

  def new

    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    Category.find_or_create_by(category_params[:categories])
    post.categories << Category.last
    redirect_to post
  end

  private

  def category_params
    params.require(:post).permit(categories:[:name])
  end

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
