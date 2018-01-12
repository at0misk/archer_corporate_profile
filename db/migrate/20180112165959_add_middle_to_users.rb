class AddMiddleToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :middle, :string
  end
end
