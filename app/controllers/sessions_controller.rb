class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        user = User.find_by(email: params[:email])
        
        if user&.authenticate(params[:password])
            payload = { user_id: user.id}
            secret = 'super secret secret'
            token = JWT.encode payload, secret
            render json: {token: token} , status: :ok
        else
            render json: { error: "Invalid email or password" }, status: :unauthorized
        end
    end

    def destroy
        puts session[:user_id]
        session.delete :user_id
        head :no_content
    end
end
