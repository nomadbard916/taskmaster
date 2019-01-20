class ChangeFinishedNameInTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :finished, :finished_at
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
