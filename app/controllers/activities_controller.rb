class ActivitiesController < ApplicationController
    def index
        @activities = current_user.activities
    end
    
    def new
        @activity = Activity.new
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

    def show
        @activity = Activity.find(params[:id])
    end

    private
    def activity_params
        params.require(:activity).permit(:name)
    end
end
