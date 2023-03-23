class UsersController < ApplicationController
    before_action :authenticate_user

    def show
        render json: current_user
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    
    private

    def user_params
        params.permit(:username, :password, :password_cornfirmation)
    end


    def authenticate_user
        head :unauthorized unless current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

end
