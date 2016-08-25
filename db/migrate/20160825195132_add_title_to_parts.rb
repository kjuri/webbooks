class AddTitleToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :title, :string
  end
end
