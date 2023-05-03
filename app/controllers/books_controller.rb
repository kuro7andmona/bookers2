class BooksController < ApplicationController

before_action :authenticate_user!
before_action :is_matching_login_user, only:[:edit]

def new
  @books = Book.new
end

def index
  @book = Book.new
  @books = Book.all
  @user = current_user
end

def create
 @book = Book.new(book_params)
 @book.user_id = current_user.id
 if @book.save
   redirect_to book_path(@book.id)
 else
   @user = current_user
   @books = Book.all
   render :index
 end
end

def show
  @book = Book.find(params[:id])
  @user = @book.user
end



def edit
  @book = Book.find(params[:id])
end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
end

def update
 book = Book.find(params[:id])
 book.update(book_params)
 flash[:notice] = "You have updated book successfully."
 redirect_to books_path
end

private

def book_params
  params.require(:book).permit(:title, :body, :image,:user_id)
end

def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to book_path
    end
end
end
