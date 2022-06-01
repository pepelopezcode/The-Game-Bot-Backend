class CreateWordleScores < ActiveRecord::Migration[7.0]
  def change
    create_table :wordle_scores do |t|
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
