class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :price, null: false
      t.string :purchase_date, null: false

      t.timestamps
    end
  end
end
