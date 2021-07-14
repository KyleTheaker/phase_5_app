class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def profile 
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def show
      user = User.find_by(id: params[:id])
      render json: { user: UserSerializer.new(user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), token: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

      def login 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          @token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), token: @token }, status: :created
        else
          render json: { message: 'Incorrect login credentials, please try again' }, status: :not_acceptable
    
      private
      def user_params
        params.require(:user).permit(:username, :password_digest,)
      end
end
