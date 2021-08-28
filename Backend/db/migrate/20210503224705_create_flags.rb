class CreateFlags < ActiveRecord::Migration[6.1]
  def change
    create_table :flags do |t|
      t.references :work_targets, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
