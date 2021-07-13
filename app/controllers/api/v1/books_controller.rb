class BooksController < ApplicationController
    before_action :find_note, only: [:update]
    def index
        @books = Book.all
        render json: {book: BookSerializer.new(books)} 
# show associated data for the instance that is called
    
      end
    def update 
        @book.update(book_params)
        if @book.save
          render json: @book, status: :accepted
        else
            render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
      def book_params
        params.permit(:title, :author, :book_id)
      end
      def find_book
        @book = Book.find(params[:id])
      end
    end

end
