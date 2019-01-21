class TagsController < ApplicationController
    before_action :find_task
    
    
    # This index action actually does tags indexing and showing
    def index
        @tags = Tag.all
        #tag.where...
        @tag = Tag.new

    end

    def create
        @tag = @task.tags.create(tag_params[:content])
        if @tag.save
          flash[:success] = "Tag successfully created"
          redirect_back fallback_location: root_path
        else
          flash[:error] = "Something went wrong"
          redirect_back fallback_location: root_path
        end
    end
    

    

    private

    def task_params
        params.permit(:task_id)
    end

    def tag_params
        params.require(:tag).permit(:content)
    end

    def find_task
        @task = Task.find(task_params[:task_id])
    end

end
