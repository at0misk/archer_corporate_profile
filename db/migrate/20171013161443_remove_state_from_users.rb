class RemoveStateFromUsers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :comapny_state, :company_state
  end
end
