class CreateProgress < ActiveRecord::Migration[5.0]
  def change
    create_table :progresses do |t|
      t.datetime :last_activity
      t.belongs_to :book, foreign_key: true
      t.belongs_to :part, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
