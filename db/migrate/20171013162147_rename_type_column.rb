class RenameTypeColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :type, :profile_type
  end
end
