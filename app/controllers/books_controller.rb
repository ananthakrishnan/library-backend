class BooksController < ApplicationController
    def show
        data = File.read(Rails.root.join('public', 'book_data.json'))
        books = JSON.parse(data)["books"]
        book = books.find { |b| b["id"] == params[:id].to_i }
        if book
            render json: book
        else
            render json: {error: "Book not found"}, status: not_found
        end
    end
end