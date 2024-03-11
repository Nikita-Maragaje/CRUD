class BooksController < ApplicationController
    def index
        @books = Book.all 
    end

    def show
        @book = Book.find(params[:id])
    end

    def new 
        @book = Book.new 
    end

    def create
        @book = Book.create(book_params)
        if @book.save
            redirect_to books_path
        else
            render:new 
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render:edit 
        end
    end

    def destroy
        @book = Book.find(params[:id])
        if @book.destroy
            redirect_to books_path 
        end
    end

    private

    def book_params 
        params.require(:book).permit(:name)
    end
end