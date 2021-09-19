class OrdersController < ApplicationController

  def index
    @orders = Order.where(user: current_user)
  end

  def create
    @number = Number.find(params[:number_id])
    @raffle = Raffle.find(params[:raffle_id])
    @order  = Order.create!(raffle: @raffle, number: @number, amount_cents: @raffle.price_cents, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Ticket ##{@number.id} for Raffle #{@raffle.id}",
        amount: @raffle.price_cents,
        currency: @raffle.currency,
        quantity: 1
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      )
      @order.update(checkout_session_id: session.id)
      redirect_to new_order_payment_path(@order)
    end


    def show
      @order = current_user.orders.find(params[:id])
    end

  end
