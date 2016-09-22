class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
