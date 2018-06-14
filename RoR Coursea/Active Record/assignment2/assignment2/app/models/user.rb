class User < ApplicationRecord
    has_one :profile, dependent: :destroy
    has_many :todo_list
    # 'rich' many - to - many
    has_many :todo_item, through: :todo_list
    validates :username, presence: true, length: { maximum: 20 }, allow_blank: false
    # custom validator
    #validate :username_cant_start_with_b
    

    #def username_cant_start_with_b
   #        if username.start_with? 'b', 'B'
  #             errors.add(:username, "Username can't start with b!")
 #          end
#    end



end
