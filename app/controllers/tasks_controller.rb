class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit, :update, :destroy, :finish]


    def index
        # TODO: Determine admin, user and visitor
        # if session[:logged_in] && session[:user] == "admin"
        # elsif session[:logged_in]
        # else
        #   render "Join us!"
        # end
        
        @tasks = Task
                .all
                .order(deadline: :asc)
    end

    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        #FIXME: need to put ".save" to model
        @task.save
        
        if @task.save
          flash[:success] = "Task successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
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
        @task = Task.find(params[:id])
    end
    
    
    
    
    
end
