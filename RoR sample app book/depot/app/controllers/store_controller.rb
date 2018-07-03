class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end
end
