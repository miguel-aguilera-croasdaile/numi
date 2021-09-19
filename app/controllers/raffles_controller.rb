class RafflesController < ApplicationController

  def index
    @raffles = Raffle.all
  end

  def show
    @raffle = Raffle.find(params[:id])
    @numbers = @raffle.numbers
    @order = Order.new
  end

  def new
    @raffle = Raffle.new()
  end

  def create
    @raffle = Raffle.create(raffle_params)
    @raffle.user = current_user
    raffle_params[:number_amount].to_i.times do |i|
      n = Number.new(raffle: @raffle, ticket_number: (i+1))
      n.save!
    end
    @raffle.save
    redirect_to raffle_path(@raffle)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def raffle_params
    params.require(:raffle).permit(:name, :description, :end_date, :number_amount, :price_cents, :currency, :header_photo)
  end
end
