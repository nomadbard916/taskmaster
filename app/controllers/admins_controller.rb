class AdminsController < ApplicationController
  def index
    @current_admin = User.find(session[:user_id])

    @users = User.where.not(id: @current_admin.id)
                  .order(created_at: :desc)
  end

  def view_tasks
    @user = User.find(user_id_param[:id])

    user_task = Task.where(user_id: @user.id).
                      page(params[:page]).per(10)
    
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

    

  end

  def delete_task
    @task = Task.find(task_id_param[:id])

    @task.destroy

    flash[:success] = "Task deleted by admin."
    redirect_back fallback_location: admin_path

  end

  private

  def user_id_param
    params.permit(:id)
  end

  def task_id_param
    params.permit(:id)
  end
end
