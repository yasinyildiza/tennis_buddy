class CreateRatings < ActiveRecord::Migration[4.2]
  def change
    create_table :ratings do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :rate

      t.timestamps
    end
  end
end
