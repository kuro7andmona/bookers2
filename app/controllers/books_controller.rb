class BooksController < ApplicationController

def new
  @books = Book.new
end

def index
  @book = Book.new
  @books = Book.all
end

def create
 @book = Book.new(book_params)
 @book.user_id = current_user.id
 if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book.id)
 else
   render :index
 end
end

# if @book.save
#flash[:notice] = "You have created book successfully."
# redirect_to book_path
# else
#   render :show
# end
# end

def show
  @book = Book.find(params[:id])
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

end
