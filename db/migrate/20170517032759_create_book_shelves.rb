class CreateBookShelves < ActiveRecord::Migration[5.0]
  def change
    create_table :book_shelves do |t|
      t.references :book, foreign_key: true
      t.references :shelf, foreign_key: true
      t.timestamps
    end
  end
end
