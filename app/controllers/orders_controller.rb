class OrdersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.create!(order_params)
    render json: @order, status: :created

  end

  # PATCH/PUT /orders/1
  def update
     @order.update!(order_params)
    render json: @order

  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :status, :address_id, :user_payment_id)
    end

    def render_not_found_response
        render json: { error: "Order not found" }, status: :not_found
    end
end
