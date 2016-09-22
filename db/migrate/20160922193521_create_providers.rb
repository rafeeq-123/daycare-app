class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :company_name
      t.integer :amount_of_kids_allowed
      t.timestamps null: false
    end
  end
end
