# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# clean tables

# na razie nie dziala bo cascade ??? -> musze dodac cascade do kazdej z relacji :)
# moze byc zla praktyka :)

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
    next if table == 'schema_migrations'
    
    # MySQL and PostgreSQL
    #ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
    
    # SQLite
    ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

user1 = User.create({username: "Carly Florina",password_digest: "Florina"})
user2 = User.create({username: "Donald Trump",password_digest: "Trump"})
user3 = User.create({username: "Ben Carson",password_digest: "Carson"})
user4 = User.create({username: "Hillary Clinton",password_digest: "Clinton"})
# not allowing Users with blank username 
#user5 = User.create({username: "",password_digest: "Clinton"})

# in order to unique add a unique constraint on idex :)
Profile.create({gender: 'male', birth_year: '1946',first_name: 'Donald', last_name: 'Trump', user_id: user2.id})
Profile.create({gender: 'male', birth_year: '1998',first_name: 'Donald', last_name: 'Trump', user_id: user1.id})
Profile.create({gender: 'male', birth_year: '2000',first_name: 'Donald', last_name: 'Trump', user_id: user3.id})


todo_list1=TodoList.create({list_name: "Lista1",list_due_date: Date.new(2015, 12, 8), user_id: user2.id})
TodoList.create({list_name: "Lista2",list_due_date: Date.new(2015, 12, 8), user_id: user2.id})
TodoList.create({list_name: "Lista3",list_due_date: Date.new(2015, 12, 8), user_id: user2.id})


TodoItem.create({due_date: Date.new(2007, 5, 12), title: "TodoItem1",description: "1",completed: false, todo_list_id: todo_list1.id})
TodoItem.create({due_date: Date.new(2017, 5, 12), title: "TodoItem2",description: "1",completed: false, todo_list_id: todo_list1.id})
