class OrdersController < ApplicationController

  def new
    @raffle_id = params[:raffle_id]
    @raffle_number = params[:raffle_number]
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

end
