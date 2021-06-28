class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new  
    end
  end

  def show
    @post = Post.find(params[:id])

  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(params[:id])
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :name, :area_id, :hiking_date, :time, :route_name, :route_detail, :comment).merge(user_id: current_user.id)
  end

  def move_to_index
    post = Post.find(params[:id])
    unless current_user.id == post.user_id
      redirect_to action: :index
    end
  end
end
