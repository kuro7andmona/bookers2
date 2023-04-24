class BooksController < ApplicationControlle

def new
  @book =Book.new
end

def index
  @book = Book.all
end

def create
end

def show
end

def edit
end

def destroy
end

def update
end

private
def book_params
  params.require(:book).permit(:title, :opnion, :image)
end

end
