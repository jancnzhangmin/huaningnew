class ShowcontentsController < ApplicationController

  def index

      @keyword = params[:keyword]
      @contents = Content.all
      if params[:keyword] == 'express'
        @title = '新闻速递'
      end
      if params[:keyword] == 'news'
        @title = '华宁新闻'
      end
      if params[:keyword] == 'zoujin'
        @title = '走进华宁'
      end
      if params[:keyword] == 'shipinhui'
        @title = '视频汇'
      end
      if params[:keyword] == 'zhengwu'
        @title = '阳光政务'
      end
      if params[:keyword] == 'fabu'
        @title = '轻快发布'
      end
      if params[:keyword] == 'dianbo'
        @title = '栏目点播'
      end

      if @keyword
        @contents = Content.where("keyword ='"+ @keyword +"'  AND isnew = '0'").order('updated_at desc')
      end







  end

  def jsonindex
    @keyword = params[:keyword]
    @contents = Content.all
    if params[:keyword] == 'express'
      @title = '新闻速递'
    end
    if params[:keyword] == 'news'
      @title = '华宁新闻'
    end
    if params[:keyword] == 'zoujin'
      @title = '走进华宁'
    end
    if params[:keyword] == 'shipinhui'
      @title = '视频汇'
    end
    if params[:keyword] == 'zhengwu'
      @title = '阳光政务'
    end
    if params[:keyword] == 'fabu'
      @title = '轻快发布'
    end
    if params[:keyword] == 'dianbo'
      @title = '栏目点播'
    end

    if @keyword
      @contents = Content.where("keyword ='"+ @keyword +"'  AND isnew = '0'").order('updated_at desc')
    end


render :json => @contents

  end

  def show
    @content = Content.find(params[:id])
  end

end
