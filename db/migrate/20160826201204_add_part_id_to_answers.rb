class AddPartIdToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :part_id, :integer
  end
end
