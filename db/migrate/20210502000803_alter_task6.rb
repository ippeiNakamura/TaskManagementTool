class AlterTask6 < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :assumptionCost, :datetime
    change_column :tasks, :actuallyCost, :datetime
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
