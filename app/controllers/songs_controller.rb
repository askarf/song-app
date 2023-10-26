class SongsController < ApplicationController
  def index
    @songs = Song.all
    render :index
  end

  def show
    @song = Song.find_by(id: params["id"])
    render :show
  end

  def create
    @song = Song.create(
      title: "Heros",
      album: "Miracles II",
      artist: "Chayala Neuhaus",
      year: 2018,
    )
    render json: { message: "new instance created" }
  end
end
