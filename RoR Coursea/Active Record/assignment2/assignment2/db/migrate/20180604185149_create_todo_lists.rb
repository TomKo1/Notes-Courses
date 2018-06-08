class CreateTodoLists < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_lists do |t|
      t.string :list_name
      t.date :list_due_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
