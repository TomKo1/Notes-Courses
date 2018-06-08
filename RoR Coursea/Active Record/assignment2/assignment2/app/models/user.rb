class User < ApplicationRecord
    has_one :profile
    has_many :todo_list
    # 'rich' many - to - many
    has_many :todo_item, through: :todo_list
end
