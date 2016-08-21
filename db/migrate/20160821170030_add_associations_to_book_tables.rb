class AddAssociationsToBookTables < ActiveRecord::Migration[5.0]
  def change
    change_table :books do |t|
      t.timestamps
    end

    change_table :chapters do |t|
      t.belongs_to :book, index: true
      t.timestamps
    end

    change_table :parts do |t|
      t.belongs_to :chapter, index: true
      t.timestamps
    end

    change_table :decision_points do |t|
      t.belongs_to :part, index: true
      t.timestamps
    end
  end
end
