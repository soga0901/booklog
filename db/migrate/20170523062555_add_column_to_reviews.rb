class AddColumnToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :book_shelf, index: true
  end
end
