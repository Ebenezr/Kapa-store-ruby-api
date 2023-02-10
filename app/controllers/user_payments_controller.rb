class UserPaymentsController < ApplicationController
  before_action :set_user_payment, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /user_payments
  def index
    @user_payments = UserPayment.all
    render json: @user_payments, status: :ok
  end

  # GET /user_payments/1
  def show
    render json: @user_payment, status: :ok
  end

  # POST /user_payments
  def create
    @user_payment = UserPayment.create!(user_payment_params)
    render json: @user_payment, status: :created

  end

  # PATCH/PUT /user_payments/1
  def update
    if @user_payment.update!(user_payment_params)
    render json: @user_payment
  end

  # DELETE /user_payments/1
  def destroy
    @user_payment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_payment
      @user_payment = UserPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_payment_params
      params.require(:user_payment).permit(:user_id, :payment_type, :privider, :account_no)
    end

    def render_not_found_response
        render json: { error: "Payment not found" }, status: :not_found
    end
end
