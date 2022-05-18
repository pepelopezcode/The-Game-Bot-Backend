class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        user = User.create(user_params)
        
        if user.valid?
            
            session[:user_id] = user.id 
            
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private
    
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
