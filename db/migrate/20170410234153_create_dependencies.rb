class CreateDependencies < ActiveRecord::Migration[5.0]
  def change
    create_table :dependencies do |t|
      t.string :name
      t.string :authors
      t.string :version

      t.timestamps
    end
  end
end
