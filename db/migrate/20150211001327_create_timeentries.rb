class CreateTimeentries < ActiveRecord::Migration
  def change
    create_table :timeentries do |t|
    	t.belongs_to :user

    	t.datetime :time_in
    	t.datetime :time_out
    	
      t.timestamps null: false
    end
  end
end
