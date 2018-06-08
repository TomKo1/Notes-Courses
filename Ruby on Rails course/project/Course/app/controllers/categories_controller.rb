class CategoriesController < ApplicationController
	layout 'admin'
    
    before_action :check_if_logged

  	def index
  		@categories = Category.sort
	end

  	def show
		@category = Category.find(params[:id])
  	end

  	def new
		@counter = Category.count + 1
  	end

  	def edit
        @category = Category.find(params[:id])
  	 @counter = Category.count
	end

  	def delete
        @category = Category.find(params[:id])
        @counter = Category.count
  	end
    
    def update
         @category = Category.find(params[:id])
         if @category.update_attributes(category_params)
             flash[:notice] = "Category successfully modified"
             redirect_to(:action => 'show',:id => @category.id)
        else
             @counter = Category.count
             render('edit')
         end
    end
    
    def remove
       category = Category.find(params[:id]).destroy
       flash[:notice] = "Category was successfully deleted"
       redirect_to(:action => 'index')
    end
    
    def create
        @categories = Category.new(category_params)
        if @categories.save
            flash[:notice] = "Category creted"
            redirect_to(:action => 'index')
        else
            @counter = Category.count + 1
            render('new')
        end
    end
private 
        def category_params
            params.require(:Category).permit(:name, :position, :visible, :created_at)
        end
    
end
