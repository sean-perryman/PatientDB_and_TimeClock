class ChangeOtherFieldsToString < ActiveRecord::Migration
  def change
  	change_column :patients, :zip, :string
  	change_column :patients, :phone1, :string
  	change_column :patients, :phone2, :string
  	change_column :patients, :ssn, :string
  end
end
