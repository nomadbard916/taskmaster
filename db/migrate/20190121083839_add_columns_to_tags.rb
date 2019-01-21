class AddColumnsToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :content, :string, limit: 16
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
