class AuctionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_auction, only: [:show, :edit, :destroy, :update]

  def index
    @auctions = Auction.where(visible: true)
  end

  def show
    @bid = Bid.new
    @min_value = @auction.best_bid&.value || @auction.min_price
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @auction.update(auction_params)
      redirect_to auction_path(@auction)
      flash[:notice] = 'Infos atualizadas'
    else
      render :edit
      flash[:notice] = 'Verifique as infos'
    end
  end

  def start_auction
    @auction = Auction.find(params[:format])
    @auction.set_visible_auction
    @auction.save
    redirect_to auction_path(@auction)
  end

  private

  def auction_params
    params.require(:auction).permit(:name, :description, :category, :min_price, :deadline, photos: [])
  end

  def find_auction
    @auction = Auction.find(params[:id])
  end
end
