class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /products
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.create!(product_params)
    render json: @product, status: :created

  end

  # PATCH/PUT /products/1
  def update
    @product.update!(product_params)
    render json: @product

  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :rating, :price, :inventory_id, :discount_id, :category_id)
    end

    def render_not_found_response
        render json: { error: "Product not found" }, status: :not_found
    end
end
