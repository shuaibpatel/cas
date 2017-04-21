class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :old_price
      t.text :short_description
      t.text :full_description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
