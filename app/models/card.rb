class Card < ApplicationRecord
  # フリマアプリそのまま
  belongs_to :user
  validates :credit_card_id,:customer_id, presence: true
end
