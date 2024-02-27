class RenameOwnerIdInSocks < ActiveRecord::Migration[7.1]
  def change
    rename_column :socks, :owner_id, :user_id
  end
end
