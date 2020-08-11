class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:update]
  before_action :book_params, only: %i[index update]

  # GET /books
  def index
    if books = current_user.books.select(:id, :name, :image, :price, :purchase_date).page(params[:page]).per(params[:limit])
      render json: { status: 200, result: books }
    else
      render json: { status: 400, message: 'パラメーターが不正です' }
    end
  end

  # POST /books
  def create
    book = Book.new(book_params)
    if book.save
      render json: { status: 200, result: {id: book.id, name: book.name, image: book.image, price: book.price, purchase_date: book.purchase_date} }
    else
      render json: { status: 400, message: 'パラメーターが不正です' }
    end
  end

  # PATCH/PUT /books/:id
  def update
    if set_book.update(book_params)

      render json: { status: 200, result: {id: set_book.id, name: set_book.name, image: set_book.image, price: set_book.price, purchase_date: set_book.purchase_date} }
    else
      render json: { status: 400, message: 'パラメーターが不正です' }
    end
  end

  private

  def set_book
    Book.find(params[:id])
  end

  def book_params
    params.permit(:name, :image, :price, :purchase_date).merge(user_id: current_user.id)
  end
end
