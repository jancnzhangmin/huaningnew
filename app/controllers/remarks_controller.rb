class RemarksController < ApplicationController
  layout 'admin'

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(banner_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_path, notice: '成功创建.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @comment.update(banner_params)
        format.html { redirect_to comments_path, notice: '成功更新.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: '删除成功.' }
      format.json { head :no_content }
    end
  end

end