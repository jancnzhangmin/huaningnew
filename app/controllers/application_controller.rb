class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def check_login
    if session[:userid]=='' || session[:userid]==nil
      redirect_to adminlogins_path
    end
  end



end
