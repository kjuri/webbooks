class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :description
    end

    create_join_table :genres, :books do |t|
      t.index [:genre_id, :book_id]
      t.index [:book_id, :genre_id]
    end
  end
end
