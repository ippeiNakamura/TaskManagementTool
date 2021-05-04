class CreateWorkTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :work_targets do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.string :category
      t.timestamps
    end
  end
end
