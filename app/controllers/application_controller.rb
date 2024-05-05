class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user
    
    private
    
    def authenticate_user
        @current_user = User.find_by(authentication_token: params[:authentication_token])
        puts @current_user.inspect
        unless @current_user
            render json: { errors: ['Unauthorized'] }, status: 401
        end
    end
end
