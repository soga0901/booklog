class RemoveBookShelfIdFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :book_shelf_id, :refereces
  end
end
