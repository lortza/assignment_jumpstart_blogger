class ArticlesController < ApplicationController

  include ArticlesHelper

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      redirect_to edit_article_path(@article)
    end
  end

  def show
    # @article = Article.find(params[:id])
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      redirect_to edit_article_path(@article)
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to edit_article_path(@article)
    end
  end

end
