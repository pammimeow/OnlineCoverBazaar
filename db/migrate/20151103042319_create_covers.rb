class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :name
      t.text :desc
      t.float :price
      t.integer :device

      t.timestamps
    end   
  end
end
