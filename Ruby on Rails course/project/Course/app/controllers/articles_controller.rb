class ArticlesController < ApplicationController
    layout 'admin'
    
    before_action :check_if_logged
    before_action :search_page
    
  def index
      @articles = @pages.articles.sort
  end

  def new
      @articles = Article.new({:page_id => @pages.id, :name => 'Insert title'})
      @page = @pages.category.pages.sort
      @counter = Article.count + 1
  end
  
  # method to add recrod to the database ( + adding image!)
  def create
      @articles = Article.new(articles_params)
      if @articles.save
          flash[:notice] = 'Article creted'
          redirect_to(:action => 'index', :page_id => @pages.id)
          else
          @counter = Article.count + 1
          @page = Page.order('position ASC')
          render('new')
      end
  end

  def edit
      @articles = Article.find(params[:id])
      @page = Page.order('position ASC')
      @counter = Article.count
  end

  def update
      @articles = Article.find(params[:id])
      if @articles.update_attributes(articles_params)
          flash[:notice] = "Article was successfully modified"
          redirect_to(:action => 'show',:id => @articles.id, :page_id => @pages.id)
          else
          @counter = Article.count
          @page = Page.order('position ASC')
          render('edit')
      end
  end


  def delete
      @articles = Article.find(params[:id])
  end
  
  def remove
      articles = Article.find(params[:id]).destroy
      flash[:notice] = "Article #{articles.name} sucessfully removed!"
      redirect_to(:action => 'index', :page_id => @pages.id)
  end
  

  def show
      @articles = Article.find(params[:id])
  end
private

    def articles_params
        #.require(:article)
        params.require(:article).permit( :page_id, :name, :position, :visible, :pictures, :created_at, :content )
    end
    
    def search_page
        if params[:page_id]
            @pages = Page.find(params[:page_id])
        end
    end
  
end
