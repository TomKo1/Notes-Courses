class UsersController < ApplicationController
	def hello 
		@variable = 'Michal'
		@current_date = DateTime.now	
		@user = User.find(1)
		#chyba poiwinno byc User.where(name: 'Andrzej')
		#User.first
		@users= User.all		
		#@andrzej = User.find_by(name: 'Andrzej')
	end

	def witaj
		@post = Post.find(1)
	end
end
