class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # we need `list_id` to associate bookmark with corresponding list
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(@bookmark.list.id)
    if @bookmark.destroy
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
    # on met un path vers le show de list  car je suis ds un autre controller controller/method
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
