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

    def login_page

    end

    def login
        user = User.find_by(email: login_params[:email].downcase)

        if user && user.password == login_params[:password]
            session[:user_id] = user.id

            flash[:success] = "You've logged in as #{user.name}!"

            redirect_to root_path

        else
            flash[:error] = "You've enter wrong email or password."
            redirect_back fallback_location: root_path
        end

    end

    def logout
        session[:user_id] = nil
        flash[:success] = "You've logged out!"
        redirect_to root_path
    end



    private

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end

    def login_params
        params.require(:login_data).permit(:email, :password)
    end
    
    
end
