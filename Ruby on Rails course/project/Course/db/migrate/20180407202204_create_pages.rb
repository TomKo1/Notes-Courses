class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
	t.integer "category_id"
	t.string "name"
	t.integer "position"
	t.boolean "visible", :default=>true
	t.timestamps
    end
	add_index("pages", "category_id")
  end

  def down 
  	drop_table :pages
  end

end
