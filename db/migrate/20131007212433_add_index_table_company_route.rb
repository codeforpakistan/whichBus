class AddIndexTableCompanyRoute < ActiveRecord::Migration
    def up
        add_index :company_routes, [:route_id, :company_id], unique: true
      end

      def down
        remove_index :company_routes, [:route_id, :company_id], unique: true
      end
end
