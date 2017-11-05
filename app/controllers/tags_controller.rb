class TagsController < ApplicationController

  def index
    @tags = Tag.all.order('name')
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      redirect_to tags_path
      flash.notice = "Tag '#{@tag.name}' has been Deleted!"
    else
      redirect_to tags_path
      flash.notice = "Tag '#{@tag.name}' was NOT Deleted."
    end
  end
end
