class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def new
    @bid = Bid.new(bid_params)
    @auction = Auction.find(params[:auction_id])
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.auction_id = params[:auction_id]
    @auction = @bid.auction
    @bid.winning_bid = false
    @bid.user = current_user
    if @bid.value > @auction.min_price
      @bid.save
      redirect_to auction_path(@auction), notice: "Parabéns! Seu lance foi computado!"
    else
      render :new
      # notice: 'Erro! Lance deve ser maior que o valor mínimo!'
    end
  end

  def winner
    @bid.value = 
    winning_bid = true
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:value, :auction_id)
  end
end
