class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /reviews
  def index
    @reviews = Review.all
    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.create!(review_params)
    render json: @review, status: :created

  end

  # PATCH/PUT /reviews/1
  def update
     @review.update!(review_params)
    render json: @review

  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :rating, :product_id, :description)
    end

    def render_not_found_response
        render json: { error: "Review not found" }, status: :not_found
    end
end
