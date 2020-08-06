require 'rails_helper'

RSpec.describe "/books", type: :request do
  let(:book) { create(:book) }
  let(:build_book) { build(:book) }
  let(:user) { create(:user) }

  describe "GET /books" do
    context "パラメーターに問題がない場合" do
      it "書籍の一覧が取得できること" do
        user = User.find_by(id: book.user_id)
        get api_v1_books_path, params: {limit: 20, page: 1}, headers: { Authorization: user.token }
        expect(JSON.parse(response.body)["status"]).to eq(200)
      end
    end

    context "パラメーターに問題がある場合" do
      it "書籍の一覧が取得できないこと" do
        user = User.find_by(id: book.user_id)
        get api_v1_books_path, params: {limit: 20, page: 1}, headers: { Authorization: nil }
        expect(JSON.parse(response.body)["status"]).to_not eq(200)
      end
    end
  end

  describe "POST /books" do
    context "パラメーターに問題が無い場合" do
      it "書籍登録ができること" do
        expect {
          post api_v1_books_path,
              params: {name: build_book.name, image: build_book.image, price: build_book.price, purchase_date: build_book.purchase_date}, headers: { Authorization: user.token }
        }.to change(Book, :count).by(1)
      end
    end

    context "パラメーターに問題がある場合" do
      it "書籍登録ができないこと" do
        expect {
          post api_v1_books_path,
              params: {name: nil, image: build_book.image, price: build_book.price, purchase_date: build_book.purchase_date}, headers: { Authorization: user.token }
        }.to change(Book, :count).by(0)
      end
    end
  end
  describe "PUT /books/:id" do
    context "パラメータに問題が無い場合" do
      it "書籍の編集ができること" do
        put api_v1_book_path(book),
          params: { name: book.name + "edit", price: book.price, image: book.image, purchase_date: book.purchase_date }, headers: { Authorization: user.token }
          expect(JSON.parse(response.body)["status"]).to eq(200)
        end
      end
      
      context "パラメータに問題がある場合" do
        it "書籍編集ができないこと" do
          put api_v1_book_path(book),
          params: { name: nil, price: book.price, image: book.image, purchase_date: book.purchase_date }, headers: { Authorization: user.token }
          expect(JSON.parse(response.body)["status"]).to_not eq(200)
        end
      end
    end
  end
  