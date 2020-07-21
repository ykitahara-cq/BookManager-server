class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:update ]
  before_action :book_params, only: [:create, :update]

  # GET /books
  def index
    if books = fetch_list
      render json: {status: '200', result: books}
    else
      render json: {status: '400', message: "パラメーターが不正です"} 
    end
  end

  # POST /books
  def create
    book = Book.new(book_params)

    if book.save!
      render json: {status: '200', result: book}
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/:id
  def update
    if book = set_book.update!(book_params)
      render json: {status: '200', result: set_book}
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private
    def set_book
      book = Book.find(params[:id])
    end

    def book_params
      params.permit(:name, :image, :price, :purchase_date).merge(user_id: current_user.id)
    end

    def setup_limit 
      request.query_parameters[:limit].to_i
    end

    def fetch_list
      page = request.query_parameters[:page].to_i
      books = Book.where(user_id: current_user.id)
      limit = setup_limit
      unless page == 1
        books = books.map.with_index {|book, index|
          if index > limit && index < index + limit
            books = book
          end
        }.compact
      else
        books = Book.where(user_id: current_user.id).limit(setup_limit)
      end
    end
end
