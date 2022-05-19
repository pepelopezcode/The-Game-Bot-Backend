class ApplicationController < ActionController::Base

    def authorize
        auth_header = request.headers[:Authorization]
        
        if !auth_header
            render json: {message: 'Must send token in request.'}
        else
            token = auth_header.split(' ')[1]
            secret = 'super secret secret'
            
            begin
                decoded_token = JWT.decode token, secret
                payload = decoded_token.first
                user_id = payload['user_id']
                @user = User.find_by_id(user_id)

            rescue
                render json: {message: 'Invalid token'}, status: :forbidden
            end
        end
    end
end
