class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize, only: [:index, :show]


    def index 
        users = User.all
        render json: users
    end


    def create
        user = User.create(user_params)
        
        if user.valid?
            
            session[:user_id] = user.id 
            puts session[:user_id]
            
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        render json: @user 
    end


    private
    
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
