class BooksController < ApplicationController
    before_action :find_note, only: [:update]
    def index
        @books = Book.all
        render json: {book: BookSerializer.new(books)} 
# show associated data for the instance that is called
      def show 
        @book = Book.find_by(id: params[:id])
        render json: @book

      end
    def update 
        @book.update(book_params)
        if @book.save
          render json: @book, status: :accepted
        else
            render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def create 
      @book = Book.create(book_params)
      if @book.valid?
        render json: @book
      else
        render json: {error: 'failed to create book'}
    end

    def destroy
      book = Book.find(params[:id])
      book.likes.destroy_all
      book.comments.destroy_all
      book.destroy
      render json: { message: "Book Removed"}
    end

    private
      def book_params
        params.permit(:title, :author)
      end
end
