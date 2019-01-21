class TasksController < ApplicationController
    before_action :find_task, only: [:edit, :update, :destroy]
    before_action :current_user, only: [:index, :new, :create, :update, :destroy]

    


    def index
        # TODO: Determine admin and user 
        # if session[:logged_in] && session[:user] == "admin"
        # elsif session[:logged_in]
        # else
        #   render "Join us!"
        # end
        
        # Determine if user is logged in
        if session[:user_id].nil?
            @tasks = nil
        else
            # Determine how tasks are sorted
            case params[:condition]
            when "content"
                @tasks = user_task.order(content: :asc)
            when  "deadline"
                @tasks = user_task.order(deadline: :asc)
            when  "priority"
                @tasks = user_task.order(priority: :asc)
            when  "status"
                @tasks = user_task.order(status: :asc)
            when "finished_at"
                 @tasks = user_task.order(finished_at: :asc)
            else
                @tasks = user_task.order(deadline: :asc)
            end

            # Condition for if any task is finished
            @any_finished = @tasks.find_by(status: "Finished")
            
            # Limit tags to current user
            @tags= Tag.where(user_id: session[:user_id])
        end




    end

    def new
        @task = Task.new
    end
    
    def create
        @task = @user.tasks.create(task_params)
        
        
        
        if @task.save
          flash[:success] = "Task successfully created"
          redirect_to root_path
        else
          flash[:error] = "Task content must exist and can't be longer than 256 characters or empty."
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
            if task_params[:status] == "Finished"
                @task.update_attributes(finished_at: Time.now)
            else
                @task.update_attributes(finished_at: nil)
            end

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

    def search_results
        # It's ok to be without strong params as its for reading data only.

        # Find task contents by keyword
        @keyword = params[:keyword]

        @task_results = Task.where(["content LIKE ? AND user_id = ? ", "%#{@keyword}%", "#{session[:user_id]}"])

        # Find tasks with tag content containing keyword

        # set an empty array for storing results later
        @by_tag_results = []

        # Find tags by keyword first
        tag_results = Tag.where(["content LIKE ? AND user_id = ? ", "%#{params[:keyword]}%", "#{session[:user_id]}"])

        # set an empty array to store tag names later
        result_tags = []

        tag_results.each do |t|
            result_tags.push("#{t.content}")
        end


        result_tags.each do |t|
            tag = Tag.find_by(content: t)
            resulting_task = Task.find_by(id: tag.task_id)
            @by_tag_results.push(resulting_task)
        end

        


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
