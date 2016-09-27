class ChangeTableForParent < ActiveRecord::Migration
  def change
    remove_column :parents, :special_requests
  end
end
