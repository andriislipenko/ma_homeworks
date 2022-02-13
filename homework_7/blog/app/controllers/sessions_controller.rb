class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(login_params[:email].downcase)

    if @user&.authenticate(login_params[:password])
      session[:user_id] = @user.id
      render json: @user.to_json_password_excluded
    else
      render plain: 'email or password incorrect', status: :unauthorized
    end
  end

  def destroy
    session.destroy
    render plain: 'Logged out!'
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
