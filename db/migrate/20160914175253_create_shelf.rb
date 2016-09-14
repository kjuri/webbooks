class CreateShelf < ActiveRecord::Migration[5.0]
  def change
    create_table :shelves do |t|
      t.string :name
      t.string :description
      t.boolean :private
      t.belongs_to :library, foreign_key: true

      t.timestamps
    end
  end
end
