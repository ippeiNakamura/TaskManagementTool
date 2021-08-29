class UpdateTaskThree < ActiveRecord::Migration[6.1]
  #ツリー構造用のフィールド追加
  def change
      # 必須のフィールド
      add_column :tasks, :parent_id, :integer
      add_column :tasks, :lft,       :integer
      add_column :tasks, :rgt,       :integer
      add_index :tasks, :parent_id
      add_index :tasks, :lft
      add_index :tasks, :rgt
      
      # オプションのフィールド
      add_column :tasks, :depth,          :integer
      add_column :tasks, :children_count, :integer
      add_index :tasks, :depth
  end
end
