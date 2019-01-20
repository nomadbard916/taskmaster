class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update]
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
          flash[:success] = "User successfully created, please login."
          redirect_to root_path
        else
          flash[:error] = "Please properly enter your info and try again"
          render 'new'
        end
    end

    def edit
        
    end

    def update
        
        @user.update_attributes(user_params)

        if @user.update_attributes(user_params)
          flash[:success] = "Account was successfully updated"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
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

    def find_user
        @user = User.find(params[:id])
    end
    
    
end
