class MangasController < ApplicationController
  before_action :set_manga, only: [:show]

  def index
    @mangas = Manga.all
  end

  def show
  end

  private

  def set_manga
    @manga = Manga.find(params[:id])
  end
end
