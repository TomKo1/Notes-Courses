class PicturesController < ApplicationController
    layout 'admin'
 
 before_action :check_if_logged
 before_action :search_gallery
 
  def new
      @pictures = Picture.new({:name => 'Please insert picture name'})
      @counter = Picture.count + 1
      @gallery = Gallery.order('position ASC')
  end
  
  def create
      @pictures = Picture.new(pictures_params)
      if @pictures.save
          flash[:notice] = 'Picture created!'
          redirect_to(:action => 'index', :gallery_id =>  @galleryOne.id)
      else
          @counter = Picture.count + 1
          @gallery = Gallery.order('position ASC')
          render('new')
      end
  end

  def show
      @pictures = Picture.find(params[:id])
  end

  def edit
      @pictures = Picture.find(params[:id])
      @counter = Picture.count
      @gallery = Gallery.order('position ASC')
  end
  
  def update
      @pictures = Picture.find(params[:id])
      if @pictures.update_attributes(pictures_params)
          flash[:notice] = 'Picture updated!'
          redirect_to(:action => 'show',:id => @pictures.id, :gallery_id =>  @galleryOne.id)
          else
          @counter = Picture.count
          @gallery = Gallery.order('position ASC')
          render('edit')
      end
  end

  def delete
      @pictures = Picture.find(params[:id])
  end
  
  def remove
      pictures = Picture.find(params[:id]).destroy
      flash[:notice] = 'Picture removed'
      redirect_to(:action => 'index', :gallery_id =>  @galleryOne.id)
  end
  
  def index
      # doesn't work?
      @pictures = Picture.sort
      # @pictures = @galleryOne.picture.sort
  end
  
  
private
    def pictures_params
        params.require(:pictures).permit(:gallery_id, :name, :position, :visible, :picture, :created_at,:description)
    end
    
    def search_gallery
        if params[:gallery_id]
            @galleryOne = Gallery.find(params[:gallery_id])
        end
    end
  
end
