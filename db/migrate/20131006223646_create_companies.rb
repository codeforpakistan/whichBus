class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.timestamps
    end
  end
end
