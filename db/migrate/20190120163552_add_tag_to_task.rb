class AddTagToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :tags, :string
  end
end
