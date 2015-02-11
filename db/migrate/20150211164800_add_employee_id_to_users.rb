class AddEmployeeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employee_id, :integer
    add_index :users, :employee_id, unique: true
  end
end
