class CreateTask < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :flag, foreign_key: true
      t.string :name
      t.string :status
      t.float :assumptionCost
      t.float :actuallyCost
      t.string :memo
      t.date :targetDay
      t.timestamps
    end
  end
end
