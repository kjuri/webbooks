class CreateLibrary < ActiveRecord::Migration[5.0]
  def change
    create_table :libraries do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
