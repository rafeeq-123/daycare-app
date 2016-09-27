class DropKidsTable < ActiveRecord::Migration
  def change
    drop_table :kids
  end
end
