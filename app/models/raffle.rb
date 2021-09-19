class Raffle < ApplicationRecord
    has_one_attached :header_photo
    has_many :numbers, dependent: :destroy
end
