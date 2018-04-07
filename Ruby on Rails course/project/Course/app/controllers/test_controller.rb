class TestController < ApplicationController
  
  layout = false
	
  def index
	# this is method connected with index.html.erb file
  	@test_var = "Welcome to the RoR course"
	@id = params[:id].to_i # that's how we are 
  end
  def test
	render('index')
  end

  def kurs
	redirect_to('http://www.google.pl')
  end

end
