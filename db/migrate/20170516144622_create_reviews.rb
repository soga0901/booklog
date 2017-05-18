class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :rate
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.references :shelf, foreign_key: true
      t.references :status, foreign_key: true
      t.timestamps
    end
  end
end
