class AdminloginsController < ApplicationController
  layout 'admin'


  def index

  end



  def create


    admin = Admin.find_by(name:params[:login][:name])
    if admin && admin.authenticate(params[:login][:password])

      redirect_to admins_path

    else
      redirect_to action: 'index',id:0
    end
  end





end
