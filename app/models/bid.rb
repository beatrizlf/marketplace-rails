class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :value, presence: true
  validates :winning_bid, inclusion: [true, false]
end
