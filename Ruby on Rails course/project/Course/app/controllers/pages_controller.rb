class PagesController < ApplicationController
  
  layout 'admin'
  
  before_action :check_if_logged
  before_action :find_category
    
  def index
      @pages = @category.pages.sort
  end
 
  def show
      @page = Page.find(params[:id])
  end

  def new
      @page = Page.new({:category_id => @category.id, :name => "Enter the name of the page"})
      @counter = Page.count + 1
      @categoryNew = Category.order('position ASC')
  end
  
  def create
      @strona = Page.new(page_params)
      if @strona.save
          flash[:notice] = "Page creted"
          redirect_to(:action => 'index', :category_id => @category.id )
          else
            @counter = Page.count + 1
            @categoryNew = Category.order('position ASC')
            render('new')
      end
  end
  
  def edit
      @page = Page.find(params[:id])
      @categoryNew = Category.order('position ASC')
      @counter = Page.count
  end
  
  def update
      @page = Page.find(params[:id])
      if @page.update_attributes(page_params)
          flash[:notice] = "Page successfully modified"
          redirect_to(:action => 'show',:id => @page.id, :category_id => @category.id)
          else
          @counter = Page.count
          @category = Category.order('position ASC')
          render('edit')
      end
      
  end


  def delete
      @page = Page.find(params[:id])
  end
  
  def remove
      page = Page.find(params[:id]).destroy
      flash[:notice] = "Page #{page.name} was successfully deleted"
      redirect_to(:action => 'index', :category_id => @category.id)
  end
  


private

    def page_params
        params.require(:page).permit(:name, :position, :visible, :created_at, :category_id)
    end
  
  def find_category
      if params[:category_id]
          @category = Category.find(params[:category_id])
      end
  end
  
  
end
