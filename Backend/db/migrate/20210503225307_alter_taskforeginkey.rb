class AlterTaskforeginkey < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :user_id,:bigint
    add_reference :tasks, :flag, index: true,foreign_key: true
  end
end
