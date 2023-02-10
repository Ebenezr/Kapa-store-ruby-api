class CategoriesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_category, only: %i[ show update destroy ]

  # GET /categories
  def index
    @categories = Category.all
    render json: @categories, status: :ok
  end

  # GET /categories/1
  def show
    render json: @category, status: :ok
  end

  # POST /categories
  def create
    @category = Category.create!(category_params)
    render json: @category, status: :created
  end

  # PATCH/PUT /categories/1
  def update
    @category.update!(category_params)
    render json: @category, status: :accepted
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description)
    end

    def render_not_found_response
        render json: { error: "Category not found" }, status: :not_found
    end
end
