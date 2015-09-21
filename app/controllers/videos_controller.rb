class VideosController < ApplicationController
  def index
    if params[:search]
      @search = params[:search]
      @videos = Video
                .find_by_query(@search)
                .order(:updated_at)
                .page params[:page]
    else
      @videos = Video.order(:updated_at).page params[:page]
    end
  end

  def show
    @video = Video.find(params[:id])
    render :show
  end

  def new
    @video = Video.new
    render :new
  end

  def create
    video_attrs = video_params
    video_attrs[:tags] = JSON.parse(video_attrs[:tags])
    @video = Video.new(video_attrs)
    if @video.save
      redirect_to video_url(@video)
    else
      flash.now[:errors] = @video.errors.full_messages
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
    render :edit
  end

  def update
    @video = Video.find(params[:id])
    video_attrs = video_params
    video_attrs[:tags] = JSON.parse(video_attrs[:tags])
    if @video.update(video_attrs)
      redirect_to video_url(@video)
    else
      flash.now[:errors] = @video.errors.full_messages
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id]).destroy
  end

  private
  def video_params
    params.require(:video).permit(:title, :media_url, :description, :tags)
  end
end
