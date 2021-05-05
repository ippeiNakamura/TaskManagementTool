class Altersubtask < ActiveRecord::Migration[6.1]
  def change
    # 必須のフィールド
      add_column :sub_tasks, :parent_id, :integer
      add_column :sub_tasks, :lft,       :integer
      add_column :sub_tasks, :rgt,       :integer
 
      add_index :sub_tasks, :parent_id
      add_index :sub_tasks, :lft
      add_index :sub_tasks, :rgt
 
 
      # オプションのフィールド
      add_column :sub_tasks, :depth,          :integer
      add_column :sub_tasks, :children_count, :integer
 
      add_index :sub_tasks, :depth
  end
end
