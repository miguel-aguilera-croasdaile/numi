class Raffle < ApplicationRecord
    monetize :amount_cents

    has_one_attached :header_photo

end
