class CreateUserMatches < ActiveRecord::Migration[4.2]
  def change
    create_table :user_matches do |t|
      t.integer :home_user_id
      t.integer :away_user_id
      t.integer :tennis_court_id
      t.integer :number_of_sets

      t.timestamps
    end
  end
end
