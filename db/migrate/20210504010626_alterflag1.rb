class Alterflag1 < ActiveRecord::Migration[6.1]
  def change
    remove_column :flags, :work_target_id,:bigint
    add_reference :flags, :work_target, index: true,foreign_key: true
  end
end
