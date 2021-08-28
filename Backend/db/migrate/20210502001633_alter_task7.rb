class AlterTask7 < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :assumptionCost, :float
    change_column :tasks, :actuallyCost, :float
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
