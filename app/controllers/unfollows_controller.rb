class UnfollowsController < ApplicationController  
    def create
      current_user.unfollow!(params[:account_id])
      follows_count = User.find(params[:account_id]).follower_relationships.count
  
      render json: { status: 'ok', followCount: follows_count }
    end
end