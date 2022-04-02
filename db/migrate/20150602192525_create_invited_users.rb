class CreateInvitedUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :invited_users do |t|
      t.integer :inviter_id
      t.string :email

      t.timestamps
    end
  end
end
