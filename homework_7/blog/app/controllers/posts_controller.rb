class PostsController < ApplicationController
  before_action :authenticate
  before_action :owner_check, only: %i[update destroy]

  def create
    @post = Post.new(
      owner: current_user,
      title: post_params[:title],
      content: post_params[:content]
    )

    @post.category = Category.find(post_params[:category_id]) if post_params[:category_id]

    save_post
  end

  def update
    @post.title = post_params[:title]
    @post.content = post_params[:content]
    @post.category = Category.find(post_params[:category_id]) if post_params[:category_id]

    save_post
  end

  def destroy
    @post.destroy!
    render plain: 'Post destroyed successfully!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def owner_check
    @post = Post.find(params[:id])

    render plain: 'Access denied', status: :forbidden unless current_user.id == @post.owner_id
  end

  def save_post
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: :bad_request
    end
  end
end
