class SlidersController < ApplicationController
  def index
    @indexcontents = Content.where("isnew = '0' AND via = '2' ").order('updated_at desc').limit(10)

    @banners = Banner.all
    @adverts = Advert.all
    visit = Visit.last
    if visit


      if visit.pvdate.to_datetime.strftime("%Y-%m-%d") == Time.now.strftime("%Y-%m-%d")
        sum = visit.pv
        visit.pv = sum.to_i + 1
        visit.save
      else
        Visit.create(pvdate:Time.now,pv:'1')

      end


    else
      Visit.create(pvdate:Time.now,pv:'1')
    end

  end

  def search
    @contents = Content.where(isnew:'0')
  end


  def jsonindex
    @idindex = params[:idindex]


    if  (@idindex == nil || @idindex.to_i <=0 )
      @contents = Content.where(isnew:'0').order('updated_at desc').limit(10)
    end

    if  @idindex.to_i > 0
      @contents = Content.where(" id < '" + @idindex + "'  AND isnew = '0' AND via = '2' " ).order('updated_at desc').limit(10)
    end


    render :json => @contents

  end


end
