class CreateDecisionPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :decision_points do |t|
      t.string :question
      t.text :answers
    end
  end
end
