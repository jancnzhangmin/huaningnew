class CommentsController < ApplicationController

  def index
    @content = Content.find(params[:content_id])
    @users = User.all
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
    @users = User.where(isshow:'1')
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:summary, :content_id, :user_id, :isshow)
    end
end
