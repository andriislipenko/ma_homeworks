class CommentsController < ApplicationController
  before_action :authenticate

  def index
    @comments = Post.find(params[:post_id]).comments

    render json: @comments
  end

  def create
    @comment = Post.find(params[:post_id]).comments.build(content: comment_params[:content], user: current_user)

    if @comment.save
      render json: @comment
    else
      render json: @comment&.errors&.full_messages, status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
