class RelationshipsController < ApplicationController

# Creates the follow relationship
def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

# Ends the follow relationship (unfollow)
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
    format.html { redirect_to @user }
    format.js
    end
  end

end
