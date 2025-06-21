# app/controllers/lists_controller.rb
class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    # MODIFIÉ : Récupérer tous les mangas pour la liste déroulante du formulaire
    @mangas = Manga.all.order(:title) # Ajouté pour le formulaire de bookmark
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List Was Successfully Created 🖤'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'List Was Successfully Updated 🖤'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Action destroy modifiée pour les Turbo Streams
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_path, notice: 'List Was Successfully Deleted !' }
      # Ceci indique à Rails de chercher un fichier destroy.turbo_stream.erb
      format.turbo_stream
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :comment, :photo)
  end
end
