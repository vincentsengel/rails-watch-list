class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new()
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list.id
    @bookmark.comment =  bookmark_params[:comment]
    @bookmark.movie_id = bookmark_params[:movie_id]
    # raise

    if @bookmark.valid?
      @bookmark.save
      redirect_to list_path(@list)
    else
      # raise
      # render :new
      render list: 'lists/show'
    end
  end

  def destroy
    # raise
    @list = List.find(params[:id])
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:id, :movie_id, :comment, :list_id)
  end
end
