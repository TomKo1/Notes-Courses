class CreateGalleries < ActiveRecord::Migration[5.1]
  def up
    create_table :galleries do |t|
	t.string "name" 
	t.integer "position"
	t.text "description"
	t.boolean "visible", :default=>false
	t.attachment :picture
	t.timestamps
    end
  end
 
  def down 
  	drop_table :galleries
  end

end
