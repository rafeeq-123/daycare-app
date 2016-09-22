class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.text :special_requests
      t.integer :provider_id
      t.timestamps null: false
    end
  end
end
