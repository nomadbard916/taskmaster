class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created, please login."
          redirect_to root_path
        else
          flash[:error] = "Please properly enter your info and try again"
          render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end
    
    
end
