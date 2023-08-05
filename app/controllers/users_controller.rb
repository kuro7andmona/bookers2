class UsersController < ApplicationController

before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user.id)
   else
   render :edit
   end
  end

  def create
    @user = User.new(user_params)
     @book.user_id = current_user.id
    if @user.save
      redirect_to users_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :password, :password_confirmation)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end