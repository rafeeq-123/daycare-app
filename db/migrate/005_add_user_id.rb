class AddUserId< ActiveRecord::Migration
  def change
    add_column :parents, :user_id, :integer
    add_column :providers, :user_id, :integer
  end
end
