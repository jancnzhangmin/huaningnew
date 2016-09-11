class AdminloginsController < ApplicationController
  layout 'admin'


  def index

  end



  def create


    admin = Admin.find_by(name:params[:login][:name])
    if admin && admin.authenticate(params[:login][:password])

      session[:userid]=admin.id
      session[:username]=admin.name
      session[:auth]=admin.auth
      redirect_to admins_path

    else
      redirect_to action: 'index',id:0
    end
  end


  def getuser
    if params[:login] && params[:password]
      admin = Admin.find_by_tel(params[:login])
      if
      admin.status==1
        admin && admin.authenticate(params[:password])
        session[:adminid] = admin.id
        session[:adminname]=admin.name
        session[:login]=admin.login
        render :json=>admin
      else
        render :json=>nil
      end
    else
      render :json=>nil
    end
  end



end
