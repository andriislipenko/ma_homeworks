class PostsController < ApplicationController
  before_action :authenticate
  before_action :owner_check, only: %i[update destroy]

  def mark
    @post = Post.find(params[:post_id])

    current_user.chosen_posts << @post
    render json: current_user.chosen_posts
  end

  def index
    @posts = Post.all
    @posts = current_user.chosen_posts if params.key? :chosen_posts
    @posts = @posts.by_creation_date(params.key?(:desc)) if params.key? :sort_by_date
    @posts = @posts.by_category(params[:category_id]) if params[:category_id]

    render json: @posts
  end

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
