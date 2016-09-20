class AddCoverToBooks < ActiveRecord::Migration[5.0]
  def change
    add_attachment :books, :cover
  end
end
