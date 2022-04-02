class CreateMatchSets < ActiveRecord::Migration[4.2]
  def change
    create_table :match_sets do |t|
      t.integer :user_match_id
      t.integer :home_user_score
      t.integer :away_user_score

      t.timestamps
    end
  end
end
