class ActivitiesController < ApplicationController
    def index
        @activities = current_user.activities
    end

    def show
        @activity = Activity.find(params[:id])
        redirect_to lifting_entries_path if @activity.id == 1
        redirect_to running_entries_path if @activity.id == 2
    end
    
    def new
        @activity = Activity.new
    end

    def edit
        @activity = Activity.find(params[:id])
    end

    def create
        @activity = Activity.new(activity_params)
        current_user.activities << @activity
        if @activity.save
          redirect_to @activity
        else
          render 'new'
        end
    end

    def update
        @activity = Activity.find(params[:id])
       
        if @activity.update(activity_params)
          redirect_to @activity
        else
          render 'edit'
        end
    end

    def destroy
        @activity = Activity.find(params[:id])
        @activity.destroy
       
        redirect_to activities_path
    end

    private
    def activity_params
        params.require(:activity).permit(:name)
    end
end
