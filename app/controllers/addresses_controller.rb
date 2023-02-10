class AddressesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_address, only: %i[ show update destroy ]

  # GET /addresses
  def index
    @addresses = Address.all

    render json: @addresses
  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    @address = Address.create!(address_params)
    render json: @address, status: :created
  end

  # PATCH/PUT /addresses/1
  def update
     @address.update!(address_params)
    render json: @address

  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:user_id, :county, :town, :station, :line1, :line2)
    end

    def render_not_found_response
        render json: { error: "Address not found" }, status: :not_found
    end
end
