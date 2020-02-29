class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.order(created_at: :desc)
    # @topics = Topic.page(params[:page]).per(8)
  end

  def show
    @posts = @topic.posts.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to @topic, notice: "スレッド「'#{@topic.title}'」を作成しました"
    else
      render 'topics/new', alert: 'スレッドを作成できませんでした'
    end
  end

  def update
  end

  def destroy
    if @topic.destroy
      redirect_to root_path, notice: '削除しました'
    else
      redirect_to root_path, alert: '削除できませんでした'
    end
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
   params.require(:topic).permit(:title)
  end

end
