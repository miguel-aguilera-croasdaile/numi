class CreateNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :numbers do |t|
      t.integer :ticket_number
      t.references :raffle, null: false, foreign_key: true
      t.timestamps
    end
  end
end
