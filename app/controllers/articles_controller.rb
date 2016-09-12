class ArticlesController < ApplicationController
  before_action :check_login
  layout 'admin'
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Content.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Content.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Content.new(article_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @content, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def change
    c=params[:c].to_s
    cc = c.clone
    c[0]=""
    h = Content.find(c)
    if cc[0] == 'w'
      h.via=0
    elsif cc[0] == 'd'
      h.via=1
    else
      h.via=2
    end
    h.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.fetch(:content, {})
    end
end
