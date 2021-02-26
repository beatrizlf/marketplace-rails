class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :value, presence: true
  validates :winning_bid, inclusion: [true, false]
  validate :bid_higher_than_minimun
  validate :bid_higher_than_last

  private

  def bid_higher_than_minimun
    if self.value.to_i < self.auction.min_price.to_i
      errors.add(:value, ': seu lance deve ser maior que o lance mínimo!')
    end
    puts "erro"
  end

  def bid_higher_than_last
    min_value = self.auction.best_bid&.value
    if self.value.to_i <= min_value.to_i
      errors.add(:value, ': seu lance deve ser maior que o último lance!')
    end
    puts "erro"
  end
end
