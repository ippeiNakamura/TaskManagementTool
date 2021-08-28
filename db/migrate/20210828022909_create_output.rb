class CreateOutput < ActiveRecord::Migration[6.1]
  def change
    create_table :outputs do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.time :releaseDay
      t.timestamps
    end
  end
end
