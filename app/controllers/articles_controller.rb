class ArticlesController < ApplicationController

  include ArticlesHelper

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit]

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
      flash.notice = "Article '#{@article.title}' Created!"
    else
      redirect_to edit_article_path(@article)
    end
  end

  def show
    # @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
      flash.notice = "Article '#{@article.title}' Updated!"
    else
      redirect_to edit_article_path(@article)
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
      flash.notice = "Article '#{@article.title}' has been Deleted!"
    else
      redirect_to edit_article_path(@article)
    end
  end

end
