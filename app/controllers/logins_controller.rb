class LoginsController < ApplicationController

  def index

  end



  def getuser
    if params[:login] && params[:password]
      user = User.find_by_login(params[:login])
      if user && user.authenticate(params[:password])
        session[:userid] = user.id
        session[:username]=user.name
        session[:login]=user.login
       if
         user.vcode==1
         redirect_to users_path

      else
        redirect_to action: 'index',id:1
       end
      else
        redirect_to action: 'index',id:0
      end

    end
  end



end
