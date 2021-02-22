class Auction < ApplicationRecord
  CATEGORIES = ['Hot Toys', 'Mezco', 'Neca', 'Mafex', 'Iron Studios', 'Bandai']
  has_many :bids
  validates :name, presence: true 
  validates :description, presence: true
  validates :min_price, presence: true
end
