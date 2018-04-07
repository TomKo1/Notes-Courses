class CreatePictures < ActiveRecord::Migration[5.1]
  def up
    create_table :pictures do |t|
	t.integer "gallery_id"
	t.string "name" 
	t.integer "position"
	t.boolean "visible",:default=>true
	t.string "description"
	t.attachment :picture
	t.timestamps
    end
  end

  def down
  	drop_table :pictures
  end
end
