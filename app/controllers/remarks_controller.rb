class RemarksController < ApplicationController
  before_action :check_login
  layout 'admin'
  before_action :set_remark, only: [:edit, :update, :destroy]

  def index
    @remarks= Comment.all
    @isshow =  params[:issohw]
    if params[:isshow]= 2

    end

  end

  def new
    @remark = Comment.new
  end

  def edit

  end

  def create
    @remark = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to remark_path, notice: '成功创建.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @remark.update(comment_params)
        format.html { redirect_to @comment, notice: '成功更新.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @remark.destroy
    respond_to do |format|
      format.html { redirect_to remarks_path, notice: '删除成功.' }
      format.json { head :no_content }
    end
  end

  def change
    c=params[:c].to_s
    cc = c.clone
    c[0]=""
    comment = Comment.find(c)
    if cc[0] == 'w'
      comment.isshow=0
    elsif cc[0] == 'd'
      comment.isshow=1
    else
      comment.isshow=2
    end
    comment.save
  end


  private

  def set_remark
    @remark = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:summary, :content_id, :user_id ,:isshow)
  end
end