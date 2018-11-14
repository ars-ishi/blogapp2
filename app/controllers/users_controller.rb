class UsersController < ApplicationController
  before_action :move_to_show, except: [:show, :post_articles, :favorite_articles]
  before_action :set_instances, only: [:show, :post_articles, :favorite_articles, :edit, :update]

  def show
  end

  def post_articles
  end

  def favorite_articles
    render 'post_articles'
  end

  def edit
  end

  def update
    if @user.id == current_user.id
      @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールを更新しました'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :ic_image, :bg_image)
  end

  def set_instances
    @user = User.find(params[:id])
    @user_ic = @user.ic_image.present? ? @user.ic_image.url : 'https://s3-ap-northeast-1.amazonaws.com/upload-blogapp2/uploads/user/ic_image/1/slider03.jpg'
    @user_bg = @user.bg_image.present? ? @user.bg_image.url : 'https://s3-ap-northeast-1.amazonaws.com/upload-blogapp2/uploads/user/bg_image/1/user_bg_image_basic.jpg'
    @post_articles = Article.where('user_id = ?', "#{@user.id}").includes(:user).order('created_at DESC')
    @favorite_articles = @user.articles.includes(:user).order('created_at DESC')
  end

  def move_to_show
    redirect_to user_path(params[:id]) unless params[:id].to_i == current_user.id
  end

end
