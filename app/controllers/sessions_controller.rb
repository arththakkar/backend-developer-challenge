class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: %i[login register]

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      user.generate_token
      render json: { user: user }, status: 200
    else
      render json: { errors: 'Invalid username or password' }, status: 401
    end
  end

  def register
    user = User.new(user_params)
    if user.save
      render json: { user: user }, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 401
    end
  end

  def logout
    @current_user.authentication_token = nil
    @current_user.save
    render json: { message: "Logged out" }, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
