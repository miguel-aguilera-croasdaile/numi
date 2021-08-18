class AddCurrencyToRaffles < ActiveRecord::Migration[6.1]
  def change
    add_column :raffles, :currency, :string
  end
end
