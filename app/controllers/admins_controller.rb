class AdminsController < ApplicationController
  def index
    @current_admin = User.find(session[:user_id])

    @users = User.where.not(id: @current_admin.id)
  end
end
