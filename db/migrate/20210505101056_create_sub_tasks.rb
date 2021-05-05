class CreateSubTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_tasks do |t|
      t.references :user,null:false
      t.string :name
      t.string :status
      t.time :assumptionCost
      t.time :actuallyCost
      t.string :memo
      t.timestamps
      t.timestamps
    end
  end
end
