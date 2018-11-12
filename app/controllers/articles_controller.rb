class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_article, only: [:new, :create]

  def index
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def new
  end

  def create
    if @article.save
      redirect_to article_path(@article), notice: '投稿完了しました。'
    else
      flash.now[:alert] = '投稿できませんでした。内容をご確認ください。'
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :main_image, :content)
  end

  def set_article
    @article = action_name == 'new' ? current_user.articles.new : current_user.articles.new(article_params)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
