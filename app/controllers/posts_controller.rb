class PostsController < ApplicationController
  def index
    @post = Post.order("created_at DESC")
  end

  def new
    @topic_id = params[:topic_id]
    @post = Post.new
  end

  def create
    @post = Post.new
    @topic_id = params[:topic_id]
    @post.topic_id = @topic_id
    @post.body = params[:post][:body]
    @topic = Topic.find(@topic_id)
    @post.user_id = current_user.id
    if @post.save
      redirect_to topic_path(@topic_id), notice: '投稿しました'
    else
      render 'posts/new', alert: '投稿できませんでした'
    end
  end
end
