class AdminloginsController < ApplicationController
  layout 'admin'


  def index
admin = Admin.all
    if admin.count == 0

      Admin.create(name:'管理员',login:'admin',password:'admin',password_confirmation:'admin',auth:'admin',status:1)
    end
  end



  def create


    admin = Admin.find_by(login:params[:login][:login])


    if
      admin && admin.authenticate(params[:login][:password])
      session[:adminid]=admin.id
      session[:adminname]=admin.name
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


