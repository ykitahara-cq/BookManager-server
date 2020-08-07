class AddCommnetToBooks < ActiveRecord::Migration[5.2]
  def change
    change_column_comment(:books, :name, '書籍名')
    change_column_comment(:books, :image, '書籍画像')
    change_column_comment(:books, :price, '書籍価格')
    change_column_comment(:books, :purchase_date, '書籍価格')
  end
end
