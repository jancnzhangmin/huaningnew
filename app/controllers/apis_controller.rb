class ApisController < ApplicationController

  class Contentlistclass
    attr :id,true
    attr :title,true
    attr :summary,true
    attr :content,true
    attr :cla_id,true
    attr :visit,true
    attr :created_at,true
    attr :updated_at,true
    attr :keyword,true
    attr :isshiping,true
    attr :isnew,true
    attr :contentmedia,true
    attr :via,true
  end

  def getcontentlist
    contentlist = Content.where('isnew = ? and keyword = ?',0,params[:keyword]).order('id desc')
    contentlistarr = Array.new
    contentlist.each do |f|
      contentlistcla = Contentlistclass.new
      contentlistcla.id = f.id
      contentlistcla.title = f.title
      contentlistcla.summary = f.summary
      contentlistcla.content = f.content
      contentlistcla.cla_id = f.cla_id
      contentlistcla.visit = f.visit
      contentlistcla.created_at = f.created_at
      contentlistcla.updated_at = f.updated_at
      contentlistcla.keyword = f.keyword
      contentlistcla.isshiping = f.isshiping
      contentlistcla.isnew = f.isnew
      contentlistcla.contentmedia = f.contentimedia.url
      contentlistcla.via = f.via
      contentlistarr.push contentlistcla
    end
    render json: params[:callback]+'({"contentlist":'+contentlistarr.to_json+'})',content_type: "application/javascript"
  end

  def getcontent
    content = Content.find(params[:contentid])
      contentlistcla = Contentlistclass.new
      contentlistcla.id = content.id
      contentlistcla.title = content.title
      contentlistcla.summary = content.summary
      contentlistcla.content = content.content
      contentlistcla.cla_id = content.cla_id
      contentlistcla.visit = content.visit
      contentlistcla.created_at = content.created_at
      contentlistcla.updated_at = content.updated_at
      contentlistcla.keyword = content.keyword
      contentlistcla.isshiping = content.isshiping
      contentlistcla.isnew = content.isnew
      contentlistcla.contentmedia = content.contentimedia.url
      contentlistcla.via = content.via
    render json: params[:callback]+'({"content":'+contentlistcla.to_json+'})',content_type: "application/javascript"
  end

end
