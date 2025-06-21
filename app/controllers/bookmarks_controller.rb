# app/controllers/bookmarks_controller.rb
class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      # MODIFIÉ : Assurez-vous que @mangas est disponible pour le formulaire si render "lists/show" est utilisé
      @mangas = Manga.all # Ajouté pour que le formulaire de sélection des mangas fonctionne
      @bookmarks = @list.bookmarks # Gardé pour afficher les bookmarks existants
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    # MODIFIÉ : :movie_id devient :manga_id
    params.require(:bookmark).permit(:manga_id, :comment, :custom_image_url)
  end
end
