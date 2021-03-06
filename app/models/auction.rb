class Auction < ApplicationRecord
  CATEGORIES = ['Hasbro', 'Mattel', 'McFarlane Toys', 'Hot Toys', 'Mezco', 'Neca', 'Mafex', 'Iron Studios', 'Bandai']
  has_many :bids, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :min_price, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :deadline, presence: true

  def set_visible_auction
    self.visible = true
  end

  def finish_auction
    if self.deadline < Date.today
      self.finished = true
      self.save!
      winner = best_bid     # pegar todos os bids da auction, ordernar pelo valor (desc) e o maior será o winning_bid
      winner.update(winning_bid: true) unless winner.nil?
    end
  end
  
  def self.finish_all_auctions
    Auction.all.each do |auction|
      auction.finish_auction
    end
  end

  def best_bid
    self.bids.order('value DESC').first
  end
end
