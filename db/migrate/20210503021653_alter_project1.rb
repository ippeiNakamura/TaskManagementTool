class AlterProject1 < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, foreigin_key: true
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword") :projects, :, :column_type, :column_options
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
