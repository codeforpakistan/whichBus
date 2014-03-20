class AddConfirmableToAdmin < ActiveRecord::Migration
  def up
	add_column :admins, :confirmation_token, :string
  	add_column :admins, :confirmed_at, :datetime
  	add_column :admins, :confirmation_sent_at, :datetime
  	add_column :admins, :unconfirmed_email, :string
  end
  def down
	remove_column :admins, :confirmation_token
  	remove_column :admins, :confirmed_at
  	remove_column :admins, :confirmation_sent_at
  	remove_column :admins, :unconfirmed_email		
  end
end
