class ArticleFavoritesController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  def create
    article_favorite = current_user.article_favorites.new(article_id: @article.id)
    if article_favorite.save
    else
      redirect_to root_path
    end
  end

  def destroy
    article_favorite = current_user.article_favorites.find_by(article_id: @article.id)
    if article_favorite.destroy
      render 'create'
    else
      redirect_to root_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

end
