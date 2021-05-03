class AlterTask3 < ActiveRecord::Migration[6.1]
  def change
    def down 
      remove_foreign_key :user
      remove_index :user
      remove_reference :user
    end
    def up
      add_reference :posts, :user, foreign_key: true
    end
  end
end
