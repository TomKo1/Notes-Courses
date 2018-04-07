class Category < ApplicationRecord
	has_many :pages
	scope :visible, lambda {where(:visible => true)}
	scope :invisible, lambda{where(:visible => false)}
	scope :sort, lamda{order("categories.position ASC")}
	scope :theNewest, lambda{order("categories.created_at DESC")}
end
