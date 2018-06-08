class GalleriesController < ApplicationController
    
    layout 'admin'
    
    before_action :check_if_logged

    def index
        @gallery = Gallery.sort
    end

    def new
        @gallery = Gallery.new({ :name => 'Insert name' })
        @counter = Gallery.count + 1
    end
    
    def create
        @gallery = Gallery.new(gallery_param)
        if @gallery.save
            flash[:notice] = 'Gallery creted'
            redirect_to(:action => 'index')
        else
            @counter = Gallery.count + 1
            render(:action => 'new')
        end
    end

    def show
        @gallery = Gallery.find(params[:id])
    end

    def edit
        @gallery = Gallery.find(params[:id])
        @counter = Gallery.count
    end
    
    def update
        @gallery = Gallery.find(params[:id])
        if @gallery.update_attributes(gallery_param)
            flash[:notice] = 'Gallery updated'
            redirect_to(:action => 'show', :id => @gallery.id)
            else
                @counter = Gallery.count + 1
                render(:action => 'edit')
        end
    end

    def delete
        @gallery = Gallery.find(params[:id])
    end
    
    def remove
        @gallery = Gallery.find(params[:id]).destroy
        flash[:notice] = "Gallery #{@gallery.name} was successfully removed!"
        redirect_to(:action => 'index')
    end
    
    
    def gallery_param
        params.require(:gallery).permit(:name, :position, :visible, :description, :picture)
    end
    
    
end
