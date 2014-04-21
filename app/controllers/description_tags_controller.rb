class DescriptionTagsController < ApplicationController
  def index
    @description_tags = DescriptionTag.includes(:tag)
  end

  def new
    @description_tag = DescriptionTag.new
  end

  def create
    redirect_to description_tags_path
  end

  def destroy
    redirect_to description_tags_path
  end
end
