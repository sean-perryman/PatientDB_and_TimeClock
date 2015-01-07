class ChangePatientsCodeToString < ActiveRecord::Migration
  def change
  	change_column :patients, :code, :string
  end
end
