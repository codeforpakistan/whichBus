class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.string :userName
      t.string :firstName
      t.string :lastName
      t.string :password
      t.string :streetAddress
      t.string :city
      t.string :town
      t.string :contactNumber
      t.string :secContactNumber
      t.string :email
      t.string :yserType
      t.string :organization
      t.string :user_id
      
      t.timestamps
    end
  end
end
