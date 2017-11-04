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
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end
end
