class CreateRaffles < ActiveRecord::Migration[6.1]
  def change
    create_table :raffles do |t|
      t.string :name
      t.text :description
      t.date :end_date

      t.timestamps
    end
  end
end
