class RafflesController < ApplicationController
  def index
  end

  def show
    @raffle = Raffle.find(params[:id])
  end

  def new
    @raffle = Raffle.new()
  end

  def create
    @raffle = Raffle.new(raffle_params)
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
    params.require(:raffle).permit(:name, :description, :end_date, :numbers, :price, :currency, :header_photo)
  end
end
