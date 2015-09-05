class AddAdminToUsers < ActiveRecord::Migration
  def change
    def change
      add_column :users, :admin, :boolean, null: false, default: false
    end
  end
end
