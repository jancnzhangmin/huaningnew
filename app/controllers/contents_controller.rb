#coding:utf-8
class ContentsController < ApplicationController
  layout 'admin'
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @keyword = params[:keyword]
    @contents = Content.all

    if params[:keyword] == 'express'
      @title = '新闻速递'
    end

    if params[:keyword] == 'news'
      @title = '华宁新闻_新闻'
    end
    if params[:keyword] == 'lanmu'
      @title = '华宁新闻_栏目'
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
    if params[:keyword] == 'bianmin'
      @title = '便民服务'
    end
    if params[:keyword] == 'dianbo'
      @title = '栏目点播'
    end
    if params[:keyword] == 'jiedao'
      @title = '部门街道'
    end
    if params[:keyword] == 'liantong'
      @title = '联通'
    end
    if params[:keyword] == 'lvyou'
      @title = '旅游方向标'
    end

    if @keyword
      @contents = Content.where("keyword ='"+ @keyword +"'  AND isnew = '0'").order('updated_at desc')
    end

  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
    if params[:keyword] == 'express'
      content = Content.create(isnew:'1',keyword:'express')
      redirect_to edit_content_path(content,:keyword=>'express')
    end

    if params[:keyword] == 'news'
      content = Content.create(isnew:'1',keyword:'news')
      redirect_to edit_content_path(content,:keyword=>'news')
    end
    if params[:keyword] == 'lanmu'
      content = Content.create(isnew:'1',keyword:'lanmu')
      redirect_to edit_content_path(content,:keyword=>'lanmu')
    end
    if params[:keyword] == 'zoujin'
      content = Content.create(isnew:'1',keyword:'zoujin')
      redirect_to edit_content_path(content,:keyword=>'zoujin')
    end
    if params[:keyword] == 'shipinhui'
      content = Content.create(isnew:'1',keyword:'shipinhui')
      redirect_to edit_content_path(content,:keyword=>'shipinhui')
    end
    if params[:keyword] == 'zhengwu'
      content = Content.create(isnew:'1',keyword:'zhengwu')
      redirect_to edit_content_path(content,:keyword=>'zhengwu')
    end
    if params[:keyword] == 'fabu'
      content = Content.create(isnew:'1',keyword:'fabu')
      redirect_to edit_content_path(content,:keyword=>'fabu')
    end
    if params[:keyword] == 'bianmin'
      content = Content.create(isnew:'1',keyword:'bianmin')
      redirect_to edit_content_path(content,:keyword=>'bianmin')
    end

    if params[:keyword] == 'dianbo'
      content = Content.create(isnew:'1',keyword:'dianbo')
      redirect_to edit_content_path(content,:keyword=>'dianbo')
    end

    if params[:keyword] == 'jiedao'
      content = Content.create(isnew:'1',keyword:'jiedao')
      redirect_to edit_content_path(content,:keyword=>'jiedao')
    end

    if params[:keyword] == 'liantong'
      content = Content.create(isnew:'1',keyword:'liantong')
      redirect_to edit_content_path(content,:keyword=>'liantong')
    end

    if params[:keyword] == 'lvyou'
      content = Content.create(isnew:'1',keyword:'lvyou')
      redirect_to edit_content_path(content,:keyword=>'lvyou')
    end
  end

  # GET /contents/1/edit
  def edit
    session[:keyword]=params[:keyword]
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to contents_path(:keyword=>session[:keyword]), notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_path(:keyword=>session[:keyword]), notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:title, :summary, :content, :cla_id, :visit, :keywork, :isshipin, :isnew, :contentimedia)
    end
end
