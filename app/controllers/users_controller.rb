class UsersController < ApplicationController

  before_action :logged_in?, only: [:index, :edit, :show, :update]
  #TODO: experiment with different redirects/renders to come up with a more consistent approach (redirect_to, implicit render, path redirection, etc.)
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.create(user_params)
    login(@user)
  	redirect_to @user
  end

  def show
  	@user = User.find_by_id(params[:id])
    @posts = @user.posts

    if @user != current_user
      redirect_to current_user
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    user = User.find_by_id(params[:id])
    user.update_attributes(user_params)

    redirect_to user_path(user)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :avatar)
    end

end
