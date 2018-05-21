require 'open_image_url'

class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show edit update destroy]
  before_action :set_auth

  def index
    @bookmarks = Bookmark.where(user_id: current_user).search(params[:search])
  end

  def show; end

  def new
    @bookmark = current_user.bookmarks.build
  end

  def edit; end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
