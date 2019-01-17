class DefineTaskColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :content, :text, limit: 256
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    add_column :tasks, :deadline, :datetime
    add_column :tasks, :priority, :string
    add_column :tasks, :status, :string
    add_column :tasks, :finished, :datetime
  end
end
