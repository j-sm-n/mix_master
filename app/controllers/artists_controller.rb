class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy, :edit]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @artist.update(artist_params)

    redirect_to @artist
  end

  def destroy
    @artist.destroy

    flash.notice = "Artist Deleted!"

    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end
end
