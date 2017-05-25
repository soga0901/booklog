class RemoveStatusIdFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :reviews, :statuses
    remove_index :reviews, :status_id
    remove_reference :reviews, :status
  end
end
