class OrderItemsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_order_item, only: %i[ show update destroy ]

  # GET /order_items
  def index
    @order_items = OrderItem.all

    render json: @order_items
  end

  # GET /order_items/1
  def show
    render json: @order_item
  end

  # POST /order_items
  def create
    @order_item = OrderItem.create!(order_item_params)
    render json: @order_item, status: :created

  end

  # PATCH/PUT /order_items/1
  def update
    if @order_item.update!(order_item_params)
    render json: @order_item
  end

  # DELETE /order_items/1
  def destroy
    @order_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id)
    end

    def render_not_found_response
        render json: { error: "Order item not found" }, status: :not_found
    end
end
