class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(list: @list, movie: @movie)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      redirect_to @list, alert: @bookmark.errors.full_messages.join('. ')
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to @list, notice: 'Bookmark was successfully deleted.'
  end
end
