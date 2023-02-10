class InventoriesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_inventory, only: %i[ show update destroy ]

  # GET /inventories
  def index
    @inventories = Inventory.all

    render json: @inventories
  end

  # GET /inventories/1
  def show
    render json: @inventory
  end

  # POST /inventories
  def create
    @inventory = Inventory.create!(inventory_params)
    render json: @inventory, status: :created

  end

  # PATCH/PUT /inventories/1
  def update
    @inventory.update!(inventory_params)
    render json: @inventory

  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:product_id, :quantity)
    end

    def render_not_found_response
        render json: { error: "Inventory not found" }, status: :not_found
    end
end
