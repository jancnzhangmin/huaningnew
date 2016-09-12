class AdminloginsController < ApplicationController
  layout 'admin'


  def index

  end



  def create


    admin = Admin.find_by(name:params[:login][:name])


    if

      admin && admin.authenticate(params[:login][:password])
      session[:userid]=admin.id
      session[:username]=admin.name
      session[:auth]=admin.auth
      session[:login]=admin.login

      if
      admin.status==1
        redirect_to contents_path
      else
        redirect_to action: 'index',id:1
      end
    else
      redirect_to action: 'index',id:0
    end



    end
  end


