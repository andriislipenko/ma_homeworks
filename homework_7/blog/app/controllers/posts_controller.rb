class PostsController < ApplicationController
  before_action :authenticate

  def create
    @post = Post.new(
      owner: current_user,
      title: post_params[:title],
      content: post_params[:content]
    )

    @post.category = Category.find(post_params[:category_id]) if post_params[:category_id]

    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: :bad_request
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end
