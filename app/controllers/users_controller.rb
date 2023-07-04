class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render :create, status: :created
    else
      render json: { Errors: @user.errors }, status: :bad_request
    end
  end

  def confirm_email
    user_id = JsonWebToken.decode(params[:token])[:user_id]
    @user = User.find user_id
    @user.confirm_email
    @user.save

    render :confirm_email, status: :ok
  rescue JWT::DecodeError, JWT::ExpiredSignature, ActiveRecord::RecordNotFound => e
    render json: { errors: e.message }, status: :unauthorized
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :locale)
  end
end
