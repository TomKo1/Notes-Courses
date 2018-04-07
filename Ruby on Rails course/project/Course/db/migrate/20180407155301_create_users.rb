class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
	t.string "name", :limit=>20
	t.string "surname", :limit=>60
	t.string "user", :limit=>25
	t.string "email", :limit=>100, :default=>"", :null=>false
	t.string "phone_number", :default=>"", :null=>false
	#password_digest is required by bcrypt
	t.string "password_digest"
	t.timestamps
    end
	# this function adds index on specific column 
	add_index("Users", "user")
  end
 
  def down 
    drop_table :Users
  end

end
