class PagesController < ApplicationController

  before_action do
    @photos = Photo.all.order("created_at desc").page(params[:page])
    @current_user = User.find_by id: session[:id]

  end

  def index

  end

  def admin
    if @current_user.present? && @current_user.admin_status == true
      @photo = Photo.new
    else
      redirect_to :root, notice: "👮 Nope"
    end
  end

  def create

    if params[:photo].nil?
      redirect_to :admin, notice: "You must select an image to upload"
      return
    end

    @photo = Photo.new params.require(:photo).permit(:picture)
    if @photo.save
      redirect_to :root
    else
      render :admin
    end
  end
end
