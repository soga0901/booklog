class Reviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :status, :integer
  end
end
