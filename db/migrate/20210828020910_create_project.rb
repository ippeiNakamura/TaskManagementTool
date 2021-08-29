class CreateProject < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key:true
      t.string :name
      t.timestamps
    end
  end
end
