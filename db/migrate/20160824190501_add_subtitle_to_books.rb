class AddSubtitleToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :subtitle, :string
  end
end
