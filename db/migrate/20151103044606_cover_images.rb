class CoverImages < ActiveRecord::Migration
  def change
  	create_table :cover_images do |t|
      t.string :image_loc
      t.references :device
      t.timestamps
    end    	
  end
end
