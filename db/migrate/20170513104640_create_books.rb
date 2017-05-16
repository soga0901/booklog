class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.text :image
      t.integer :release_year
      t.integer :release_month
      t.integer :release_day
      t.timestamps
    end
  end
end
