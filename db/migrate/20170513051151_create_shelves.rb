class CreateShelves < ActiveRecord::Migration[5.0]
  def change
    create_table :shelves do |t|
      t.string :name
      t.text :introducing
      t.references :user, foreingn_key: true
      t.timestamps
    end
  end
end
