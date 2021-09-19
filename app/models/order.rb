class Order < ApplicationRecord
  belongs_to :user
  belongs_to :raffle
  belongs_to :number
end
