class ChangeAgeParent < ActiveRecord::Migration
  def change
    remove_column :parents, :child_age
  end
end
