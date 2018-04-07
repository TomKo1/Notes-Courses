class Page < ApplicationRecord
	belongs_to :category
	has_many :articles
end
