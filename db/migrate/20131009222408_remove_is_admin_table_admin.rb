class RemoveIsAdminTableAdmin < ActiveRecord::Migration
    def up
        remove_column :admins, :isAdmin
      end

      def down
        add_column :admins, :isAdmin, :boolean 
      end
end
