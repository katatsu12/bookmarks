class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def friends_bookmark
    @friend_bookmark = User.get_friends_bookmarks(current_user)
  end
end
