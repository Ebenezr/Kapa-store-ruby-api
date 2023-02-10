class DiscountsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_discount, only: %i[ show update destroy ]

  # GET /discounts
  def index
    @discounts = Discount.all

    render json: @discounts
  end

  # GET /discounts/1
  def show
    render json: @discount
  end

  # POST /discounts
  def create
    @discount = Discount.create!(discount_params)
    render json: @discount, status: :created

  end

  # PATCH/PUT /discounts/1
  def update
     @discount.update!(discount_params)
      render json: @discount

  end

  # DELETE /discounts/1
  def destroy
    @discount.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discount_params
      params.require(:discount).permit(:description, :active, :discount_percentage)
    end

    def render_not_found_response
        render json: { error: "Discount not found" }, status: :not_found
    end
end
