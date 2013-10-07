class CreateCompanyRoutes < ActiveRecord::Migration
  def change
    create_table :company_routes do |t|
        t.belongs_to :route
        t.belongs_to :company

      t.timestamps
    end
  end
end
