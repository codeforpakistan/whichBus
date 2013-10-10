class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|

      t.timestamps
    end
  end
end
