class Auction < ApplicationRecord
  CATEGORIES = ['Hot Toys', 'Mezco', 'Neca', 'Mafex', 'Iron Studios', 'Bandai']
  has_many :bids
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

  def finished?
    if self.deadline > Date.today
      self.visible = false
    end
  end
end
