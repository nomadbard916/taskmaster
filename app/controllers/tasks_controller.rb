class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end
    
    def create
        @object = Object.new(params[:object])
        if @object.save
          flash[:success] = "Object successfully created"
          redirect_to @object
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
        @task = Task.find()
    end

    def edit

    end


    def update
        @task = Task.find(params[:id])
        if @task.update_attributes(params[:object])
          flash[:success] = "Task was successfully updated"
          redirect_to @task
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    
    def destroy
        @task = Task.find(params[:id])
        if @task.destroy
            flash[:success] = 'Task was successfully deleted.'
            redirect_to tasks_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to tasks_url
        end
    end
    
    
    
    
    
end
