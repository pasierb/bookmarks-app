class BookmarksController < ApplicationController
  before_action :get_bookmarks, only: :index
  before_action :get_bookmark, only: [:edit, :update, :show]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = BookmarkService.create(attributes: permitted_params)

    respond_to do |format|
      format.html {
        redirect_to bookmarks_path and return unless @bookmark.new_record?

        render :new
      }
    end
  end

  def update
    success = BookmarkService.update(
      bookmark: @bookmark,
      attributes: permitted_params
    )

    respond_to do |format|
      format.html {
        redirect_to bookmarks_path and return if success

        render :edit
      }
    end
  end

  private

  def get_bookmarks
    @bookmarks ||= Bookmark.search(params[:search]).includes(:site)
  end

  def get_bookmark
    @bookmark ||= Bookmark.where(id: params[:id]).first
  end

  def permitted_params
    params.require(:bookmark).permit(:title, :url, :short, :tagline)
  end

end
