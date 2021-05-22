class CreateWorkDays < ActiveRecord::Migration[6.1]
  def change
    create_table :work_days do |t|
      
      t.timestamps
    end
  end
end
