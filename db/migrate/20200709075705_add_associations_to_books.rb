class AddAssociationsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :user, index: true
  end
end
