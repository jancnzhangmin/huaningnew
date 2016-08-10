class CommentsController < ApplicationController

  def index
    @content = Content.find(params[:content_id])
    @users = User.all
    @comment = Comment.where(isshow:'2')
  end

  def create
    @content = Content.find(params[:content_id])
    @comment = @content.comments.create(summary:params[:summary],content_id:params[:content_id],user_id:params[:user_id],isshow:params[:isshow])
    #redirect_to content_comments_path(@content)
    render json: @comment
  end

  def createnew
    @content = Content.find(params[:content_id])
    @comment = @content.comments.create(summary:params[:summary],content_id:params[:content_id],user_id:params[:user_id],isshow:params[:isshow])
    #redirect_to content_comments_path(@content)
    render json: @comment
  end

  def show
    @content = Content.find(params[:content_id])
    @users = User.where(isshow:'2')
  end

  def destroy
    @remark.destroy
    respond_to do |format|
      format.html { redirect_to remarks_path, notice: '删除成功.' }
      format.json { head :no_content }
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through#.
  def set_remark
    @remark = Comment.find(params[:id])
  end

  def comment_params
      params.require(:comment).permit(:summary, :content_id, :user_id, :isshow)
    end
end
