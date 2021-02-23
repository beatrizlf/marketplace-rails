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
<<<<<<< HEAD
  # validates :visible?, inclusion: [true, false]

  def set_visible_auction
    self.visible = true
  end  
=======
>>>>>>> 561a2ec2fb3fdd0538379c459a2e203b3684f7b7
end
