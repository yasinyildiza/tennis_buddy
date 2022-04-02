class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      t.string :name
      t.string :surname
      t.date :birthday
      t.string :profile_picture
      t.integer :gender_id
      t.integer :age
      t.integer :tennis_club_id
      t.integer :tennis_court_id
      t.integer :city_id
      t.integer :skill_level_id
      t.text :about_me

      t.timestamps
    end
  end
end
