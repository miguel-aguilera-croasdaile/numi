class AddNumbersAndNumberPriceToRaffles < ActiveRecord::Migration[6.1]
  def change
    add_column :raffles, :numbers, :integer
    add_monetize :raffles, :price, currency: { present: false }
  end
end
