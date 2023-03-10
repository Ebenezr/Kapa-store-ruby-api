class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /users
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)
    render json: @user, status: :accepted
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:full_name, :email, :telephone)
    end

    def render_not_found_response
      render json: { error: "User not found" }, status: :not_found
    end
end
