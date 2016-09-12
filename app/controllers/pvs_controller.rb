class PvsController < ApplicationController
  before_action :check_login
  layout 'admin'
  def index
    @pv = Visit.all
    day = Time.now
    a = day.strftime('%Y-%m').to_i
    if params[:pvdate] && params[:pv]
      hh = Visit.pv(where(pvdate.to_datetime.strftime("%Y-%m")))
      if pv.pvdate.to_datetime.strftime("%Y-%m") == Time.now.strftime("%Y-%m")

      end
    else
      #render :json=>nil
    end

  end



  def getpv

    currentmouth = Time.now.strftime('%Y-%m')
    mouths=Visit.where("pvdate like '%"+currentmouth +"%'")
   #JsonObject jobj=new JsonObject(mouths);
    #String needStr=jobj.getStrig("pvdate");



    render json:(mouths)



  end


end







