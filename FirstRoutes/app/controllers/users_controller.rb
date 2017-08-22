class UsersController < ApplicationController
  def index
    users = User.includes(params[:id])
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unproccessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    render json: user
  end


  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:id).permit(:name, :email)
  end
end
