class ShowcontentsController < ApplicationController

  def index
    def index
      @keyword = params[:keyword]
      @contents = Content.all
      if params[:keyword] == 'express'
        @title = '新闻速递'
      end

      if @keyword
        @contents = Content.where("keyword ='"+ @keyword +"'  AND isnew = '0'").order('updated_at desc')
      end

    end
  end

  def show
    @content = Content.find(params[:id])
  end

end
