class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def new
    @bid = Bid.new(bid_params)
    @auction = Auction.find(params[:auction_id])
  end

  def create
    @bid = Bid.new
    @auction = Auction.find(params[:auction_id])
    @bid.auction = @auction
    @bid.user = current_user

    if @bid.save
      redirect_to bids_path(@auction)
    else
      render :new
    end
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:value)
  end
end
