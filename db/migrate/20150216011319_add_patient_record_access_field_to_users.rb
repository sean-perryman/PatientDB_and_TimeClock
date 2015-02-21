class AddPatientRecordAccessFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :patient_record_access, :boolean
  end
end
