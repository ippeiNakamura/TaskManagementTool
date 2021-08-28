class AlterTask5 < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user,foreign_key:true
      t.string :name
      t.string :status
      t.time :assumptionCost
      t.time :actuallyCost
      t.string :memo
      t.timestamps
    end
  end
end
