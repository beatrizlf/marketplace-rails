class Auction < ApplicationRecord
  CATEGORIES = ['Hot Toys', 'Mezco', 'Neca', 'Mafex', 'Iron Studios', 'Bandai']
  has_many :bids
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :min_price, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :deadline, presence: true
  validates :visible?, inclusion: [true, false]
end
