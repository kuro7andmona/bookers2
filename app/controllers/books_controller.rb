class BooksController < ApplicationControlle

def new
  @book =Book.new
end

def index
  @book = Book.all
end

def create
 book = Book.new(book_params)
 book.save
 flash[:notice] = "You have created book successfully."
 redirect_to books_path
end

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
  params.require(:book).permit(:title, :opnion, :image)
end

end
