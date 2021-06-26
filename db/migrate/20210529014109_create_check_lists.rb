class CreateCheckLists < ActiveRecord::Migration[6.1]
  def change
    create_table :check_lists do |t|
      t.integer :task_ids
      t.timestamps
    end
  end
end
