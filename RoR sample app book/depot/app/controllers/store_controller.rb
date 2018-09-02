class StoreController < ApplicationController
  skip_before_action :authorize

  # for pluralize
  include ActionView::Helpers::TextHelper
  include CurrentCart
  before_action :set_cart

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
