class PicturesController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def delete
  end
  
  def index
      @pictures = Picture.sort
  end
  
end
