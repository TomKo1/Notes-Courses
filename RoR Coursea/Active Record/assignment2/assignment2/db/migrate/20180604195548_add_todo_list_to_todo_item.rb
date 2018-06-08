class AddTodoListToTodoItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :todo_items, :todo_list, foreign_key: true
  end
end
