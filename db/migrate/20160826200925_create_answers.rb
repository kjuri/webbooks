class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :decision_point, foreign_key: true
    end
  end
end
