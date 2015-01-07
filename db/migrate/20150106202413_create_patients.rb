class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :patientID
      t.integer :code
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone1
      t.integer :phone2
      t.string :sex
      t.string :birthdate
      t.integer :ssn

      t.timestamps null: false
    end

    add_index :patients, :patientID, unique: true
    add_index :patients, :first_name
    add_index :patients, :last_name
  end
end
