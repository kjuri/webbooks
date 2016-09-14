class RemoveColumnsFromDecisionPoints < ActiveRecord::Migration[5.0]
  def change
    remove_column :decision_points, :answers
  end
end
