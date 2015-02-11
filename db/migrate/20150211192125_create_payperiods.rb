class CreatePayperiods < ActiveRecord::Migration
  def change
    create_table :payperiods do |t|
      t.date :start
      t.date :end

      t.timestamps null: false
    end
  end
end
