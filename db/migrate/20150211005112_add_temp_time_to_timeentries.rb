class AddTempTimeToTimeentries < ActiveRecord::Migration
  def change
    add_column :timeentries, :temp_time, :datetime
  end
end
