class SongsController < ApplicationController
  def index
    @songs = Song.all
    render :index
  end

  def show
    @song = Song.find_by(id: params["id"])
    render :show
  end

  def destroy
    song = Song.find_by(id: params["id"])
    song.delete
    render json: { message: "song deleted" }
  end

  def create
    @song = Song.create(
      title: params["title"],
      album: params["album"],
      artist: params["artist"],
      year: params["year"],
    )
    render json: { message: "new instance created" }
  end
end
