class StoreController < ApplicationController
  # for pluralize
  include ActionView::Helpers::TextHelper
  
  def index
    @products = Product.order(:title)
    @time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    if session[:counter].nil? 
        session[:counter] = 1 
      else
          session[:counter] += 1
      end
      @counter = session[:counter]
      @counter_msg = pluralize(session[:counter], 'time')
  end
end
