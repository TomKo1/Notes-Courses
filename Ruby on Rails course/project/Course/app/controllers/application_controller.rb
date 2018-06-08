class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
    def check_if_logged
        
        unless session[:user_id]
            flash[:notice] = 'You\'re not logged'
            redirect_to(:controller => 'access', :action => 'login')
            return false
        else
            return true
        end
        
    end
  
end
