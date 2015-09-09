class AddStatusToMovers < ActiveRecord::Migration
  def change
    add_column :movers, :status, :boolean
  end
end
