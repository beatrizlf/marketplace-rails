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
      redirect_to auction_path(@auction) # redirecionar para a página de show (auction ready)
    else
      redirect_to auction_path(@action) # redirecionar para a página de edit (revisar os detalhes antes do leilao)
    end
  end

  def edit
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path
  end

  private

  def auction_params
    params.require(:auction).permit(:name, :description, :category, :min_price, :deadline, photos: []) # colocar o visible?
  end

  def find_auction
    @auction = Auction.find(params[:id])
  end
end
