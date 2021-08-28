class Dropsubtask < ActiveRecord::Migration[6.1]
  def change
    drop_table :sub_tasks
  end
end
