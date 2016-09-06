class SlidersController < ApplicationController
  def index
    @indexcontents = Content.where(isnew: '0').order('updated_at desc').limit(10)
    @banners = Banner.all
    @adverts = Advert.all
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
      @contents = Content.where(" id < '" + @idindex + "'  AND isnew = '0'" ).order('updated_at desc').limit(10)
    end


    render :json => @contents

  end


end
