class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    @user.email.downcase!

    if @user.save
      render json: @user.to_json_password_excluded
    else
      render json: @user.errors.full_messages, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
