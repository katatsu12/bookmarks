class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[show edit update destroy]

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Added friend.'
      redirect_to root_url
    else
      flash[:error] = 'Unable to add friend.'
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
