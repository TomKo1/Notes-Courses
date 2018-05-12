class ArticlesController < ApplicationController
    layout 'admin'
    
  def index
      @articles = Article.sort
  end

  def new
      @articles = Article.new({:name => 'Insert title'})
      @page = Page.order('position ASC')
      @counter = Article.count + 1
  end
  
  # method to add recrod to the database ( + adding image!)
  def create
      @articles = Article.new(articles_params)
      if @articles.save
          flash[:notice] = 'Article creted'
          redirect_to(:action => 'index')
          else
          @counter = Article.count + 1
          @page = Page.order('position ASC')
          render('new')
      end
  end

  def edit
  end

  def delete
  end

  def show
  end
  
  def articles_params
      #.require(:article)
      params.require(:article).permit( :page_id, :name, :position, :visible, :pictures, :created_at )
  end
  
end
