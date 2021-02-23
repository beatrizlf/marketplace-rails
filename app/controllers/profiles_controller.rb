class ProfilesController < ApplicationController
  def show
    @user = current_user
    @auctions = Auction.where(user: current_user)
    @bids = Bid.where(user: current_user)
  end
end
