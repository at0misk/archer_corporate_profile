class AddSmokingToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :smoking, :string
  end
end
