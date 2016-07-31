class AddProfileFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.text :bio
      t.date :birthday
    end
  end
end
