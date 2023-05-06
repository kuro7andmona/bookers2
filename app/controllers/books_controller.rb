class BooksController < ApplicationController

#before_action :is_matching_login_user, only:[:edit, :update]

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
   flash[:noticce] = "You have created book successfully."
   redirect_to book_path(@book.id)
 else
   @user = current_user
   @books = Book.all
   render :index
 end
end

def show
  @new_book = Book.new
  @book = Book.find(params[:id])
  @user = @book.user
end



def edit
  @book = Book.find(params[:id])
  @user = current_user
   if @user != @book.user
     redirect_to books_path
   end
end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
end

def update
 @book = Book.find(params[:id])
 if @book.update(book_params)
 flash[:notice] = "You have updated book successfully."
 redirect_to book_path(@book.id)
 else
   render :edit
 end
end

private

def book_params
  params.require(:book).permit(:title, :body, :image,:user_id)
end


end
