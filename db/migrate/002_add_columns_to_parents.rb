class AddColumnsToParents < ActiveRecord::Migration
  def change
    add_column :parents, :child_name, :string
    add_column :parents, :child_age, :integer
    add_column :parents, :schedule, :string
  end
end
