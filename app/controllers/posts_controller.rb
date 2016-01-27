class PostsController < ApplicationController

  before_action :logged_in?, only: [:index, :new, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @city_id = City.find_by_id(params[:id])
    @current_user = current_user
  end

  def show
  	@post = Post.find_by_id(params[:id])
  end

  def create

    @current_user = current_user
    @city_id = City.find_by_id(params[:city_id])
    @post = Post.create(post_params)

    redirect_to city_path(@post.city)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(post_params)

    redirect_to user_path(@post.user)
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy

    redirect_to user_path(@post.user)
  end
end

private
  # both uses of params.require asked for different amounts of attributes, please reach consensus
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :city_id)
  end
