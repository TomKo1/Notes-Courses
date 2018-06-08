class AccessController < ApplicationController
  
  layout 'admin'
  
  before_action :check_if_logged, :except => [:logout, :loginUser, :login]
  
  
  
  def loginUser
      if params[:user].present? && params[:password].present?
          admin = User.where(:user => params[:user]).first
          if admin
              admin_authorization = admin.authenticate(params[:password])
          end
      end
      
      if admin_authorization
          session[:user_id] = admin_authorization.id
          session[:user] = admin_authorization.user
          flash[:notice] = 'Logged in'
          redirect_to(:action => 'index')
      else
          flash[:notice] = 'error: the user name or password is not valid!'
          redirect_to(:action => 'login')
      end
  end
  
  def logout
      session[:user_id] = nil
      session[:user] = nil
      flash[:notice] = 'Logged out'
      redirect_to(:action => 'login')
  end
  
  def index
  end

  def login
  end
end
