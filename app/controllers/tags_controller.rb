class TagsController < ApplicationController
    before_action :find_task
    
    
    # This index action actually does tags indexing and showing
    def index
        @tags = Tag.where(task_id: @task.id)
        
        @tag = Tag.new

    end

    def create
        @tag = @task.tags.create(tag_params)
        

        if @tag.save
            # FIXME: Problematic but feasible implementation, should find some method to deal with association with both task and user when creating tag object.
          @tag.update_attributes(user_id: session[:user_id])
          flash[:success] = "Tag successfully created"
          redirect_back fallback_location: root_path
        else
          flash[:error] = "Tag content can't be longer than 16 characters"
          redirect_back fallback_location: root_path
        end
    end

    def  destroy
        @tag = Tag.find(params[:id])
        if @tag.destroy
            flash[:success] = 'Tag was successfully deleted.'
            redirect_back fallback_location: root_path
        else
            flash[:error] = 'Something went wrong'
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
