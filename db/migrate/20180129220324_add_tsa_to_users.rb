class AddTsaToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :tsa, :string
  end
end
