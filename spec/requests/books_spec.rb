require 'rails_helper'

RSpec.describe "/books", type: :request do
  let(:book) { create(:book) }
  let(:build_book) { build(:book) }
  let(:user) { create(:user) }

  describe "GET /books" do
    context "パラメーターに問題がない場合" do
      # it "書籍の一覧が取得できること" do
      #   user = User.find_by(id: book.user_id)
      #   get api_v1_books_path, params: {limit: 20, page: 1}, headers: { Authorization: user.token }
      #   expect(response).to have_http_status(200)
      # end
    end

  #   # context "パラメーターに問題がある場合" do
  #   #   it "書籍の一覧が取得できないこと" do
  #   #     book = Book.create! valid_attributes
  #   #     get book_url(book), as: :json
  #   #     expect(response).to be_successful
  #   #   end
  #   # end
  # end

  describe "POST /books" do
    context "パラメーターに問題が無い場合" do
      # it "書籍登録ができること" do
      #   expect {
      #     post api_v1_books_path,
      #         params: {name: build_book.name, image: build_book.image, price: build_book.price, purchase_date: build_book.purchase_date}, headers: { Authorization: user.token }
      #   }.to change(Book, :count).by(1)
      # end

      # it "renders a JSON response with the new book" do
      #   post books_url,
      #        params: { book: valid_attributes }, headers: valid_headers, as: :json
      #   expect(response).to have_http_status(:created)
      #   expect(response.content_type).to match(a_string_including("application/json"))
      # end
    end

  #   context "with invalid parameters" do
  #     it "does not create a new Book" do
  #       expect {
  #         post books_url,
  #              params: { book: invalid_attributes }, as: :json
  #       }.to change(Book, :count).by(0)
  #     end

  #     it "renders a JSON response with errors for the new book" do
  #       post books_url,
  #            params: { book: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json")
  #     end
  #   end
  end

  describe "PUT /books/:id" do
    context "パラメータに問題が無い場合" do
      it "書籍の編集ができること" do
        put api_v1_book_path(book),
          params: { name: book.name + "edit", price: book.price, image: book.image, purchase_date: book.purchase_date }, headers: { Authorization: user.token }
          expect(response).to have_http_status(200)
      end

      # it "renders a JSON response with the book" do
      #   book = Book.create! valid_attributes
      #   patch book_url(book),
      #         params: { book: invalid_attributes }, headers: valid_headers, as: :json
      #   expect(response).to have_http_status(:ok)
      #   expect(response.content_type).to eq("application/json")
      # end
    end

    # context "with invalid parameters" do
    #   it "renders a JSON response with errors for the book" do
    #     book = Book.create! valid_attributes
    #     patch book_url(book),
    #           params: { book: invalid_attributes }, headers: valid_headers, as: :json
    #     expect(response).to have_http_status(:unprocessable_entity)
    #     expect(response.content_type).to eq("application/json")
    #   end
    end
  end
end
