class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end
    
    def show
        @entry = Entry.find(params[:id])
    end

    def new
        @entry = Entry.new(activity_id: params[:id])
        logger.debug "Hey!? DEBUG!! #{@entry.instance_variables}"
    end

    def edit
        @entry = Entry.find(params[:id])
    end

    def create
        logger.debug "Hey!? DEBUG!! #{params}"
        @entry = Entry.new(entry_params)
        logger.debug "Hey!? DEBUG!! #{entry_params}"
        @entry.images.attach(params[:images])
        if @entry.save
          redirect_to @entry
        else
          render 'new'
        end
    end

    def update
        @entry = Entry.find(params[:id])
        @entry.images.attach(params[:images])
        if @entry.update(entry_params)
          redirect_to @entry
        else
          render 'edit'
        end
    end

    def destroy
        @entry = Entry.find(params[:id])
        @entry.destroy
       
        redirect_to entries_path
    end
       
    private
    def entry_params
        logger.debug "Hey!? DEBUG!! #{params}"
        params.require(:entry).permit(:title, :text, :activity_id, :images)
    end
end