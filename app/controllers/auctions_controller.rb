class AuctionsController < ApplicationController
  before_action :find_auction, only: [:show, :edit, :destroy]
  def index
    @auctions = Auction.all
  end

  def show
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save 
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def edit
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
