class TasksController < ApplicationController
    before_action :find_task, only: [:edit, :update, :destroy, :finish]
    before_action :current_user, only: [:index, :new, :create, :update, :destroy, :finish]

    


    def index
        # TODO: Determine admin and user 
        # if session[:logged_in] && session[:user] == "admin"
        # elsif session[:logged_in]
        # else
        #   render "Join us!"
        # end
        
        if session[:user_id].nil?
            @tasks = nil
        else
            

            if params[:condition].blank?
            @tasks = user_task.order(deadline: :asc)
        
            elsif params[:condition] == "content"
                @tasks = user_task.order(content: :asc)
            elsif params[:condition] ==  "deadline"
                @tasks = user_task.order(deadline: :asc)
            elsif params[:condition] ==  "priority"
                @tasks = user_task.order(priority: :asc)
            elsif params[:condition] ==  "status"
                @tasks = user_task.order(status: :asc)
            else
                @tasks = user_task.order(deadline: :asc)
            end

        end


        
                

        
    end

    def new
        @task = Task.new
    end
    
    def create
        @task = @user.tasks.create(task_params)
        #FIXME: need to put ".save" to model
        
        
        if @task.save
          flash[:success] = "Task successfully created"
          redirect_to root_path
        else
          flash[:error] = "Task content must exist and can't be longer than 256 characters."
          render 'new'
        end
    end

    def show
        # Just show content on index, no need to show on another page
    end

    
    def edit
        
    end


    def update
        
        if @task.update_attributes(task_params)
          flash[:success] = "Task was successfully updated"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    

    
    def destroy
        
        if @task.destroy
            flash[:success] = 'Task was successfully deleted.'
            redirect_to tasks_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to tasks_url
        end
    end

    #TODO: "finish" method

    def finish
    end

    private

    def task_params
        params
            .require(:task)
            .permit(
                :content, :deadline, :priority, :status
            )
    end

    def find_task
        
        
        @task = Task.find_by(id: params[:id], user_id: session[:user_id])
    end

    def current_user
        if session[:user_id].nil?
            return
        else
        @user = User.find(session[:user_id])
        end
    end

    def user_task
        Task.where(user_id: @user.id).
        page(params[:page]).per(10)
    end

    
    
    
    
    
    
end
