class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user,null:false
      t.string :name
      t.string :status
      t.time :assumptionCost
      t.time :actuallyCost
      t.string :memo
      t.timestamps
    end
  end
end
