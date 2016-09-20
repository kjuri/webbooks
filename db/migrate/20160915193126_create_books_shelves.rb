class CreateBooksShelves < ActiveRecord::Migration[5.0]
  def change
    create_join_table :books, :shelves do |t|
      t.index [:shelf_id, :book_id]
      t.index [:book_id, :shelf_id]
    end
  end
end
