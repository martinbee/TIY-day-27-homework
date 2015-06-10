class TagsController < ApplicationController
  def show
    @tag_name = params[:tag]
    @photos = Photo.tagged_with(@tag_name)
  end
end
