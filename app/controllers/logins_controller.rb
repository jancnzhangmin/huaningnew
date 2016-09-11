class LoginsController < ApplicationController

  def index

  end

  def getuser
    if params[:login] && params[:password]
      user = User.find_by_tel(params[:login])
      if
        user.vcode==0
        user && user.authenticate(params[:password])
        session[:userid] = user.id
        session[:username]=user.name
        session[:login]=user.login
        render :json=>user
      else
        render :json=>nil
      end
    else
      render :json=>nil
    end
  end

end
