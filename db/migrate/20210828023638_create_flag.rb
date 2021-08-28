class CreateFlag < ActiveRecord::Migration[6.1]
  def change
    create_table :flags do |t|
      t.references :output, foreign_key: true
      t.string :name
      t.date :targetDay
      t.timestamps
    end
  end
end
